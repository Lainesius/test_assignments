import os


class StagingConfig:
    MONGO_URI = 'mongodb://localhost:27017/main'


class TestConfig:
    TESTING = True
    MONGO_URI = 'mongodb://localhost:27017/test'


class ProductionConfig:
    ENV = 'production'
    MONGO_URI = os.getenv('MONGO_URI', StagingConfig.MONGO_URI)
