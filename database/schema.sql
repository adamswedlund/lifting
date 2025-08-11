CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE exercises (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL UNIQUE,
    muscle_group TEXT
);

CREATE TABLE workouts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    started_at TIMESTAMP NOT NULL DEFAULT NOW(),
    notes TEXT
);

CREATE TABLE exercises_in_workouts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    workout_id UUID NOT NULL REFERENCES workouts(id) ON DELETE CASCADE,
    exercise_id UUID NOT NULL REFERENCES exercises(id) ON DELETE RESTRICT
);

CREATE TABLE sets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    exercise_in_workout_id UUID NOT NULL REFERENCES exercises_in_workouts(id) ON DELETE CASCADE,
    set_number INT NOT NULL,
    reps INT NOT NULL,  
    weight NUMERIC(6,2)
);