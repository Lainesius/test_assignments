from app.db import db


def insert_songs(to_insert=None, count=1):
    if to_insert is None:
        to_insert = [
            {
                'artist': 'The Yousicians',
                'title': 'Lycanthropic Metamorphosis',
                'difficulty': 14.6,
                'level': 13,
                'released': '2016-10-26',
            }
            for _ in range(count)
        ]

    return db.songs.insert_many(to_insert)
