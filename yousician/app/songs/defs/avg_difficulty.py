from pydantic import BaseModel, conint


class AvgDifficultyDataIn(BaseModel):
    level: conint(ge=0) = None


class AvgDifficultyDataOut(BaseModel):
    avg_difficulty: float = None
