import os

from app import create_app
from app.config import StagingConfig


app = create_app(os.getenv('APP_CONFIG'), StagingConfig)
