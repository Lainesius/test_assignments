from pydantic import BaseModel, conint


class AddRatingDataIn(BaseModel):
    rating: conint(ge=1, le=5)
    song_id: str


class ViewRatingDataIn(BaseModel):
    song_id: str


class ViewRatingDataOut(BaseModel):
    avg: float = None
    max: float = None
    min: float = None
