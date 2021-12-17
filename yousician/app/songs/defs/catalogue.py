import datetime as dt

from pydantic import BaseModel, conint


class Song(BaseModel):
    artist: str
    difficulty: float
    level: int
    released: dt.date
    title: str


class SongsDataIn(BaseModel):
    chunk_size: conint(le=250) = 10  # some sane limit to avoid quering thousands (or more!) songs at once
    last_id: str = None
    message: str = None


class SongsDataOut(BaseModel):
    last_id: str = None
    songs: list[Song]
