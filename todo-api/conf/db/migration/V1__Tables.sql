-- ************************************** "todo"

CREATE TABLE "todo"
(
    "id"         varchar   NOT NULL,
    "title"      varchar   NOT NULL,
    "completed"  boolean   NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    "description" varchar NOT NULL,
    "tags" varchar[] NOT NULL,
    "deleted_at" timestamp,
    "parent_id"  varchar,
    CONSTRAINT "PK_todo" PRIMARY KEY ("id"),
    CONSTRAINT "FK_parent_todo" FOREIGN KEY ("parent_id") REFERENCES "todo" ("id") ON DELETE CASCADE
);
