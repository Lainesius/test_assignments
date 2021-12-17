from flask import Flask, jsonify
from pydantic import ValidationError

from app.songs.resources import songs_blueprint


def create_app(config='app.config.StagingConfig'):
    app = Flask(__name__, static_folder=None)
    app.config.from_object(config)
    app.register_blueprint(songs_blueprint, url_prefix='/songs')
    app.errorhandler(ValidationError)(handle_validation_error)

    return app


def handle_validation_error(e):
    return jsonify(error='validation_error'), 406
