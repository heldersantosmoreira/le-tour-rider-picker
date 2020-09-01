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

ActiveRecord::Schema.define(version: 2020_09_01_212016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "picks", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "rider_id"
    t.bigint "stage_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "rider_updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "score"
    t.index ["stage_id"], name: "index_picks_on_stage_id"
    t.index ["user_id", "rider_id", "stage_id"], name: "index_picks_on_user_id_and_rider_id_and_stage_id", unique: true
    t.index ["user_id"], name: "index_picks_on_user_id"
  end

  create_table "riders", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_riders_on_name", unique: true
  end

  create_table "stages", force: :cascade do |t|
    t.string "number"
    t.datetime "date"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.index ["number"], name: "index_stages_on_number", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "token"
    t.string "name"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "picks", "riders"
end
