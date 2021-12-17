import json

from app import create_app
from app.db import db
from app.songs.tests.helpers import insert_songs


class TestAddRating:
    def setup_method(self, method):
        self.url = '/songs/rating'
        self.app = create_app('app.config.TestConfig')
        self.client = self.app.test_client()

    def teardown_method(self, method):
        with self.app.app_context():
            db.songs.drop()

    def test_invalid_content_type(self):
        response = self.client.post(self.url, data='SHAME ON YOU SWEET NEREVAR', content_type='text/html')
        assert response.status_code == 400
        data_out = json.loads(response.data)
        assert data_out['error'] == 'Invalid POST data'

    def test_invalid_data(self):
        response = self.client.post(self.url, json={'song_id': '61bbf143e02f3966f2ec432e'})
        assert response.status_code == 406
        response = self.client.post(self.url, json={'rating': 4})
        assert response.status_code == 406
        response = self.client.post(self.url, json={'song_id': '61bbf143e02f3966f2ec432e', 'rating': 6})
        assert response.status_code == 406

    def test_invalid_id(self):
        response = self.client.post(self.url, json={'song_id': 'OBJECTION', 'rating': 5})
        assert response.status_code == 400
        data_out = json.loads(response.data)
        assert data_out['error'] == 'Invalid song id provided: OBJECTION'

    def test_song_not_found(self):
        response = self.client.post(self.url, json={'song_id': '61bbf143e02f3966f2ec432e', 'rating': 5})
        assert response.status_code == 404
        data_out = json.loads(response.data)
        assert data_out['error'] == 'Song with id 61bbf143e02f3966f2ec432e was not found'

    def test_ok(self):
        with self.app.app_context():
            inserted = insert_songs().inserted_ids[0]
            response = self.client.post(self.url, json={'song_id': str(inserted), 'rating': 5})
            assert response.status_code == 200
            data_out = json.loads(response.data)
            assert data_out['status'] == 'ok'
            song = db.songs.find_one({'_id': inserted})
            assert song['ratings'] == [5]


class TestViewRating:
    def setup_method(self, method):
        self.url = '/songs/rating'
        self.app = create_app('app.config.TestConfig')
        self.client = self.app.test_client()

    def teardown_method(self, method):
        with self.app.app_context():
            db.songs.drop()

    def test_invalid_id(self):
        response = self.client.get(self.url + '?song_id=OBJECTION')
        assert response.status_code == 400
        data_out = json.loads(response.data)
        assert data_out['error'] == 'Invalid song id provided: OBJECTION'

    def test_song_not_found(self):
        response = self.client.get(self.url + '?song_id=61bbf143e02f3966f2ec432e')
        assert response.status_code == 404
        data_out = json.loads(response.data)
        assert data_out['error'] == 'Song with id 61bbf143e02f3966f2ec432e was not found'

    def test_song_no_ratings(self):
        with self.app.app_context():
            inserted = insert_songs().inserted_ids[0]
        response = self.client.get(self.url + f'?song_id={inserted}')
        assert response.status_code == 200
        data_out = json.loads(response.data)
        assert data_out['avg'] is None
        assert data_out['min'] is None
        assert data_out['max'] is None

    def test_ok(self):
        with self.app.app_context():
            inserted = insert_songs(
                [
                    {
                        "artist": "The Yousicians",
                        "title": "Greasy Fingers - boss level",
                        "difficulty": 2,
                        "level": 3,
                        "released": "2016-03-01",
                        "ratings": [1, 2, 2, 4, 3, 1],
                    }
                ]
            ).inserted_ids[0]
        response = self.client.get(self.url + f'?song_id={inserted}')
        assert response.status_code == 200
        data_out = json.loads(response.data)
        assert data_out['avg'] == 2.1666666666666665
        assert data_out['min'] == 1
        assert data_out['max'] == 4
