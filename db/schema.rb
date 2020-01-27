# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_27_020644) do

  create_table "corners", force: :cascade do |t|
    t.string "title"
    t.string "subject"
    t.text "introduction"
    t.integer "alive_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "program_id"
    t.index ["program_id"], name: "index_corners_on_program_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "subject"
    t.text "content"
    t.integer "corner_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["corner_id"], name: "index_posts_on_corner_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "title"
    t.text "memo"
    t.string "email"
    t.string "cast"
    t.string "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "key_station"
    t.string "local_station"
    t.time "starts_at"
    t.time "ends_at"
    t.string "hp"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "radio_name", default: ""
    t.string "full_name"
    t.string "birth_day"
    t.string "postcode"
    t.text "address"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "birth_year"
    t.string "birth_month"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "posts", "corners"
  add_foreign_key "posts", "users"
end
