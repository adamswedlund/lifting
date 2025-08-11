INSERT INTO exercises (name, muscle_group) VALUES
('Bench Press', 'Chest'),
('Squats', 'Legs'),
('Curls', 'Biceps'),
('Pulldowns', 'Back');

INSERT INTO workouts (started_at, notes) VALUES
(NOW(), 'Push Day');


INSERT INTO exercises_in_workouts (workout_id, exercise_id) VALUES
(
    (SELECT id from workouts LIMIT 1),
    (SELECT id from exercies WHERE name = 'Bench Press')
);

INSTERT INTO sets(exercise_in_workout_id, set_number, reps, weight) VALUES
(
    (SELECT id from exercises_in_workouts LIMIT 1),
    1, 8, 135
);