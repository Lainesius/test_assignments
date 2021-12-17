import copy
import json

import pymongo

from app import create_app
from app.db import db
from app.songs.tests.helpers import insert_songs


class TestCatalogue:
    def setup_method(self, method):
        self.url = '/songs/catalogue'
        self.app = create_app('app.config.TestConfig')
        self.client = self.app.test_client()

    def teardown_method(self, method):
        with self.app.app_context():
            db.songs.drop()

    def test_empty(self):
        response = self.client.get(self.url)
        assert response.status_code == 200
        data_out = json.loads(response.data)
        assert data_out['songs'] == []
        assert data_out['last_id'] is None

    def test_simple_ok(self):
        with self.app.app_context():
            input_data = [
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
            inserted = insert_songs(copy.deepcopy(input_data)).inserted_ids
        response = self.client.get(self.url)
        assert response.status_code == 200
        data_out = json.loads(response.data)
        assert data_out['songs'] == input_data
        assert data_out['last_id'] == str(inserted[-1])

    def test_pagination(self):
        with self.app.app_context():
            input_data = [
                {
                    'artist': 'First',
                    'title': 'Half',
                    'difficulty': 10,
                    'level': 10,
                    'released': '2020-01-01',
                }
                for _ in range(5)
            ] + [
                {
                    'artist': 'Second',
                    'title': 'Half',
                    'difficulty': 5,
                    'level': 5,
                    'released': '2030-01-01',
                }
                for _ in range(5)
            ]

            inserted = insert_songs(copy.deepcopy(input_data)).inserted_ids
        response = self.client.get(self.url + f'?last_id={inserted[4]}')
        assert response.status_code == 200
        data_out = json.loads(response.data)
        assert len(data_out['songs']) == 5
        assert data_out['songs'] == [
            {
                'artist': 'Second',
                'title': 'Half',
                'difficulty': 5,
                'level': 5,
                'released': '2030-01-01',
            }
            for _ in range(5)
        ]
        assert data_out['last_id'] == str(inserted[-1])

    def test_invalid_id(self):
        response = self.client.get(self.url + '?last_id=UwU')
        assert response.status_code == 400
        data_out = json.loads(response.data)
        assert data_out['error'] == 'Invalid last_id provided: UwU'

    def test_search(self):
        with self.app.app_context():
            db.songs.create_index([('artist', pymongo.TEXT), ('title', pymongo.TEXT)])
            input_data = [
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
            inserted = insert_songs(copy.deepcopy(input_data)).inserted_ids
        response = self.client.get(self.url + '?message=YaMaOkA')
        assert response.status_code == 200
        data_out = json.loads(response.data)
        assert data_out['songs'] == [
            {
                'artist': 'Promise (reprise)',
                'title': 'Akira Yamaoka',
                'difficulty': 5,
                'level': 5,
                'released': '2001-09-24',
            },
        ]
        assert data_out['last_id'] == str(inserted[-1])

    def test_implicit_chunk_size(self):
        with self.app.app_context():
            insert_songs(None, count=15)
        response = self.client.get(self.url)
        assert response.status_code == 200
        data_out = json.loads(response.data)
        assert len(data_out['songs']) == 10

    def test_chunk_size_too_large(self):
        response = self.client.get(self.url + '?chunk_size=9000')
        assert response.status_code == 406

    def test_complex_combination_empty(self):
        with self.app.app_context():
            db.songs.create_index([('artist', pymongo.TEXT), ('title', pymongo.TEXT)])
            input_data = [
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
            inserted = insert_songs(copy.deepcopy(input_data)).inserted_ids
        response = self.client.get(self.url + f'?message=Heilung&chunk_size=1&last_id={inserted[0]}')
        assert response.status_code == 200
        data_out = json.loads(response.data)
        assert data_out['songs'] == []
        assert data_out['last_id'] is None

    def test_complex_combination(self):
        with self.app.app_context():
            db.songs.create_index([('artist', pymongo.TEXT), ('title', pymongo.TEXT)])
            input_data = [
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
                {
                    'artist': 'Promise (reprise)',
                    'title': 'Akira Yamaoka',
                    'difficulty': 5,
                    'level': 5,
                    'released': '2001-09-24',
                },
                {
                    'artist': 'Heilung',
                    'title': 'In Maidjan',
                    'difficulty': 10,
                    'level': 10,
                    'released': '2017-11-01',
                },
                {
                    'artist': 'Heilung',
                    'title': 'In Maidjan',
                    'difficulty': 10,
                    'level': 10,
                    'released': '2017-11-01',
                },
            ]
            inserted = insert_songs(copy.deepcopy(input_data)).inserted_ids
        response = self.client.get(self.url + f'?message=HEILUNG&chunk_size=1&last_id={inserted[0]}')
        assert response.status_code == 200
        data_out = json.loads(response.data)
        assert data_out['songs'] == [
            {
                'artist': 'Heilung',
                'title': 'In Maidjan',
                'difficulty': 10,
                'level': 10,
                'released': '2017-11-01',
            },
        ]
        assert data_out['last_id'] == str(inserted[3])
