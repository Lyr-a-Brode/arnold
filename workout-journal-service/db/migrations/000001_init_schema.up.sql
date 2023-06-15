CREATE TABLE "exercices" (
  "id" bigserial PRIMARY KEY,
  "title" varchar UNIQUE NOT NULL
);

CREATE TABLE "workout_plans" (
  "id" bigserial PRIMARY KEY,
  "title" varchar UNIQUE NOT NULL,
  "active" boolean DEFAULT FALSE
);

CREATE TABLE "workout_plan_days" (
  "id" bigserial PRIMARY KEY,
  "plan_id" bigint,
  "day" int NOT NULL,
  "exercice_id" bigint
);

CREATE TABLE "workouts" (
  "id" bigserial PRIMARY KEY,
  "plan_id" bigint,
  "started_at" timestamptz DEFAULT (now()),
  "length_seconds" int DEFAULT 0
);

CREATE TABLE "sets" (
  "id" bigserial PRIMARY KEY,
  "workout_id" bigint,
  "exercice_id" bigint,
  "started_at" timestamptz DEFAULT (now()),
  "length_seconds" int DEFAULT 0,
  "reps" int NOT NULL,
  "weight_kg" int NOT NULL
);

ALTER TABLE "workout_plan_days" ADD FOREIGN KEY ("plan_id") REFERENCES "workout_plans" ("id");

ALTER TABLE "workout_plan_days" ADD FOREIGN KEY ("exercice_id") REFERENCES "exercices" ("id");

ALTER TABLE "workouts" ADD FOREIGN KEY ("plan_id") REFERENCES "workout_plans" ("id");

ALTER TABLE "sets" ADD FOREIGN KEY ("workout_id") REFERENCES "workouts" ("id");

ALTER TABLE "sets" ADD FOREIGN KEY ("exercice_id") REFERENCES "exercices" ("id");
