from flask import request

from app.db import db
from app.songs.defs.avg_difficulty import AvgDifficultyDataIn, AvgDifficultyDataOut
from app.songs.resources import songs_blueprint


@songs_blueprint.route('/avg_difficulty', methods=['GET'])
def avg_difficulty():
    data_in = AvgDifficultyDataIn(**request.args)

    if data_in.level is None:
        filters = {}
    else:
        filters = {'level': data_in.level}

    q = db.songs.aggregate([{'$match': filters}, {'$group': {'_id': None, 'avg': {'$avg': '$difficulty'}}}])

    try:
        avg_difficulty = next(q)['avg']
    # just to distinguish the case where filter filtered out everything
    except StopIteration:
        avg_difficulty = None

    # no info on precision, so I didn't add it, but rounding to 2 decimal places seems like a clean option
    return AvgDifficultyDataOut(avg_difficulty=avg_difficulty).json()
