from bson.errors import InvalidId
from bson.objectid import ObjectId
from flask import jsonify, request

from app.db import db
from app.songs.defs.catalogue import Song, SongsDataIn, SongsDataOut
from app.songs.resources import songs_blueprint


@songs_blueprint.route('/catalogue', methods=['GET'])
def catalogue():
    data_in = SongsDataIn(**request.args)
    filters = {}
    # mobile-style "swipe to load more" seems to fit the usage more than "here's number of pages, pick a page"
    # also I've read that the latter becomes inefficient in mongo as the number of documents increases
    if data_in.last_id:
        try:
            filters['_id'] = {'$gt': ObjectId(data_in.last_id)}
        except InvalidId:
            return jsonify(error=f'Invalid last_id provided: {data_in.last_id}'), 400
    # rather than creating a separate route for search in "C" part of the assignment, I've integrated the
    # functionality in this resource - it seems like the most natural extension of its functionality
    # after all, search seems like a primary usage for this - "I'm going to scroll all the songs you have"
    # seems like a minor usage case, not the reverse
    if data_in.message:
        # requires text index
        filters['$text'] = {'$search': f'\"{data_in.message}\"'}

    db_songs = list(db.songs.find(filters).sort('_id').limit(data_in.chunk_size))
    if db_songs:
        last_id = str(db_songs[-1]['_id'])
        # implies that song structure is stable int terms of required fields present
        # if that is not the case, can be modified in a for loop with try-except to ignore "bad" data
        songs = [Song(**song) for song in db_songs]
    else:
        last_id = None
        songs = []

    return SongsDataOut(last_id=last_id, songs=songs).json()
