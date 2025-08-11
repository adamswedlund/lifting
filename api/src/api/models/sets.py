from pydantic import BaseModel
from uuid import UUID


class SetCreate(BaseModel):
    set_number: int
    reps: int
    weight: float = None


class SetRead(BaseModel):
    id: str # UUID as string
