from bson.errors import InvalidId
from bson.objectid import ObjectId
from flask import jsonify, request

from app.db import db
from app.songs.defs.rating import AddRatingDataIn, ViewRatingDataIn, ViewRatingDataOut
from app.songs.resources import songs_blueprint


@songs_blueprint.route('/rating', methods=['POST'])
def add_rating():
    # just some sanity checking
    request_data = request.get_json()
    if request_data is None:
        return jsonify(error='Invalid POST data'), 400
    else:
        data_in = AddRatingDataIn(**request_data)

    # a very naive solution that leads to creating new ratings every single time it's called
    # real-life usage would have users in the data scheme, so when a user updates his rating for a song,
    # it would do exactly that: update his rating and not create a new one - yay upsert
    try:
        db_call = db.songs.update_one(
            {'_id': ObjectId(data_in.song_id)}, {'$push': {'ratings': data_in.rating}}
        )
    except InvalidId:
        return jsonify(error=f'Invalid song id provided: {data_in.song_id}'), 400

    if db_call.modified_count == 0:
        return jsonify(error=f'Song with id {data_in.song_id} was not found'), 404
    else:
        return jsonify(status='ok'), 200


@songs_blueprint.route('/rating', methods=['GET'])
def view_rating_data():
    data_in = ViewRatingDataIn(**request.args)

    try:
        # this looks like something that will require an index
        # however, it's unlikely that it would help avg as the number of ratings keeps increasing
        # that would probably require something smarter
        db_call = list(
            db.songs.aggregate(
                [
                    {'$match': {'_id': ObjectId(data_in.song_id)}},
                    {
                        '$project': {
                            'avg': {'$avg': '$ratings'},
                            'max': {'$max': '$ratings'},
                            'min': {'$min': '$ratings'},
                        }
                    },
                ]
            )
        )
    except InvalidId:
        return jsonify(error=f'Invalid song id provided: {data_in.song_id}'), 400

    if len(db_call) == 0:
        return jsonify(error=f'Song with id {data_in.song_id} was not found'), 404
    else:
        return ViewRatingDataOut(**db_call[0]).json()
