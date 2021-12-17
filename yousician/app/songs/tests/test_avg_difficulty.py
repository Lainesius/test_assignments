import json

from app import create_app
from app.db import db
from app.songs.tests.helpers import insert_songs


class TestAvgDifficulty:
    def setup_method(self, method):
        self.url = '/songs/avg_difficulty'
        self.app = create_app('app.config.TestConfig')
        self.client = self.app.test_client()

    def teardown_method(self, method):
        with self.app.app_context():
            db.songs.drop()

    def test_invalid_level(self):
        response = self.client.get(self.url + '?level=-1')
        assert response.status_code == 406
        data_out = json.loads(response.data)
        assert data_out['error'] == 'validation_error'

    def test_no_songs(self):
        response = self.client.get(self.url)
        assert response.status_code == 200
        data_out = json.loads(response.data)
        assert data_out == {'avg_difficulty': None}

    def test_no_songs_level_filter(self):
        with self.app.app_context():
            insert_songs(None, 5)
            response = self.client.get(self.url + '?level=1')
            assert response.status_code == 200
            data_out = json.loads(response.data)
            assert data_out == {'avg_difficulty': None}

    def test_ok(self):
        with self.app.app_context():
            insert_songs(
                [
                    {
                        'artist': 'Heilung',
                        'title': 'In Maidjan',
                        'difficulty': 10,
                        'level': 10,
                        'released': '2017-11-01',
                    },
                    {
                        'artist': 'Promise (reprise)',
                        'title': 'Akira Yamaoka',
                        'difficulty': 5,
                        'level': 5,
                        'released': '2001-09-24',
                    },
                ]
            )
            response = self.client.get(self.url)
            assert response.status_code == 200
            data_out = json.loads(response.data)
            assert data_out == {'avg_difficulty': 7.5}

    def test_ok_level_filter(self):
        with self.app.app_context():
            insert_songs(
                [
                    {
                        'artist': 'Heilung',
                        'title': 'In Maidjan',
                        'difficulty': 10,
                        'level': 10,
                        'released': '2017-11-01',
                    },
                    {
                        'artist': 'Promise (reprise)',
                        'title': 'Akira Yamaoka',
                        'difficulty': 5,
                        'level': 5,
                        'released': '2001-09-24',
                    },
                ]
            )
            response = self.client.get(self.url + '?level=5')
            assert response.status_code == 200
            data_out = json.loads(response.data)
            assert data_out == {'avg_difficulty': 5}
