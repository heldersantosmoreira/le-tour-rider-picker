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

ActiveRecord::Schema.define(version: 2020_08_26_105542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "picks", force: :cascade do |t|
    t.bigint "user_id"
    t.string "rider_name"
    t.integer "stage"
    t.datetime "created_at"
    t.boolean "visible", default: false
    t.index ["user_id", "rider_name", "stage"], name: "index_picks_on_user_id_and_rider_name_and_stage", unique: true
    t.index ["user_id"], name: "index_picks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "token"
    t.string "name"
    t.datetime "created_at"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

end