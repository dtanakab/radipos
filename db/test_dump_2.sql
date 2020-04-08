BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "active_storage_blobs" ("id" SERIAL PRIMARY KEY NOT NULL, "key" varchar NOT NULL, "filename" varchar NOT NULL, "content_type" varchar, "metadata" text, "byte_size" bigint NOT NULL, "checksum" varchar NOT NULL, "created_at" datetime NOT NULL);
INSERT INTO active_storage_blobs VALUES(205181823,'aabbWNGW1VrxZ8Eu4zmyw13A','program.png','image/png','{"identified":true,"analyzed":true}',1000,'fdUivZUf74Y6pjAiemuvlg==','2020-02-29 04:30:34.083523');
CREATE TABLE IF NOT EXISTS "corners" ("id" SERIAL PRIMARY KEY NOT NULL, "title" varchar, "subject" varchar, "introduction" text, "alive" boolean DEFAULT 1, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "program_id" integer);
CREATE TABLE IF NOT EXISTS "on_air_wdays" ("id" SERIAL PRIMARY KEY NOT NULL, "display_str" varchar, "code" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "programs" ("id" SERIAL PRIMARY KEY NOT NULL, "title" varchar, "memo" text, "email" varchar, "cast" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "station" varchar, "starts_at" time, "ends_at" time, "hp" varchar, "on_air_wday_id" integer, "timeframe" integer);
CREATE TABLE IF NOT EXISTS "users" ("id" SERIAL PRIMARY KEY NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "radio_name" varchar DEFAULT '', "full_name" varchar, "postcode" varchar, "address" text, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "confirmation_token" varchar, "confirmed_at" datetime, "confirmation_sent_at" datetime, "unconfirmed_email" varchar, "gender" varchar, "tel" varchar, "about_age" integer, "post_mail_setting" integer, "admin" boolean DEFAULT 0);
CREATE TABLE IF NOT EXISTS "active_storage_attachments" ("id" integer NOT NULL PRIMARY KEY, "name" varchar NOT NULL, "record_type" varchar NOT NULL, "record_id" integer NOT NULL, "blob_id" integer NOT NULL, "created_at" datetime NOT NULL, CONSTRAINT "fk_rails_c3b3935057"
FOREIGN KEY ("blob_id")
  REFERENCES "active_storage_blobs" ("id")
);
CREATE TABLE IF NOT EXISTS "likes" ("id" integer NOT NULL PRIMARY KEY, "user_id" integer NOT NULL, "program_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_9cfe8c187b"
FOREIGN KEY ("program_id")
  REFERENCES "programs" ("id")
, CONSTRAINT "fk_rails_1e09b5dabf"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE TABLE IF NOT EXISTS "posts" ("id" integer NOT NULL PRIMARY KEY, "subject" varchar DEFAULT NULL, "content" text DEFAULT NULL, "corner_id" integer DEFAULT NULL, "user_id" integer DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "post_mail_setting" integer DEFAULT NULL, CONSTRAINT "fk_rails_36259730b4"
FOREIGN KEY ("corner_id")
  REFERENCES "corners" ("id")
, CONSTRAINT "fk_rails_5b5ddfd518"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
select setval('users_id_seq', 576709754);
select setval('on_air_wdays_id_seq', 13);
select setval('corners_id_seq', 717124800);
select setval('active_storage_blobs_id_seq', 205181823);
select setval('programs_id_seq', 814879814);
COMMIT;
