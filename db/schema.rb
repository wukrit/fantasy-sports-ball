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

ActiveRecord::Schema.define(version: 2019_09_12_191508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "api_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "position"
    t.string "team"
    t.date "dob"
    t.string "height"
    t.integer "weight"
    t.string "college"
    t.integer "jersey"
  end

  create_table "roster_players", force: :cascade do |t|
    t.bigint "roster_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "roster_position"
    t.index ["player_id"], name: "index_roster_players_on_player_id"
    t.index ["roster_id"], name: "index_roster_players_on_roster_id"
  end

  create_table "rosters", force: :cascade do |t|
    t.string "team_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_rosters_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trades", force: :cascade do |t|
    t.integer "given_player_id"
    t.integer "received_player_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "location"
    t.integer "age"
    t.string "gender"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "roster_players", "players"
  add_foreign_key "roster_players", "rosters"
  add_foreign_key "rosters", "users"
end
