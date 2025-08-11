from pydantic import BaseModel
from datetime import datetime
from uuid import UUID
from .sets import SetCreate, SetRead


class ExerciseInWorkoutCreate(BaseModel):
    exercise_id: UUID
    sets: list[SetCreate]

class ExerciseInWorkoutRead(BaseModel):
    exercise_id: UUID
    name: str # joined with exercise table
    sets: list[SetRead]

class WorkoutCreate(BaseModel):
    started_at: datetime = None
    notes: str = None
    exercises: list[ExerciseInWorkoutCreate]

class WorkoutRead(BaseModel):
    id: UUID
    started_at: datetime
    notes: str = None

class WorkoutDetail(BaseModel):
    exercises: list[ExerciseInWorkoutRead]