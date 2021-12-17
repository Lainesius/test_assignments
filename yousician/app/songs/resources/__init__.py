from flask import Blueprint

songs_blueprint = Blueprint('songs', __name__)

from . import avg_difficulty, catalogue, rating
