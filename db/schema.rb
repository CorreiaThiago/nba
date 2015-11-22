# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151121233445) do

  create_table "divisions", force: :cascade do |t|
    t.text     "name"
    t.text     "conference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "nbacomid"
    t.date     "gamedate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.string   "homeaway"
    t.string   "winloss"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participants", ["game_id"], name: "index_participants_on_game_id"
  add_index "participants", ["team_id"], name: "index_participants_on_team_id"

  create_table "players", force: :cascade do |t|
    t.string   "nbacomid"
    t.string   "fname"
    t.string   "lname"
    t.date     "birthdate"
    t.string   "school"
    t.string   "country"
    t.integer  "height"
    t.string   "position"
    t.integer  "rookie_year"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "players", ["nbacomid"], name: "index_players_on_nbacomid", unique: true

  create_table "statistics", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.boolean  "starter"
    t.integer  "time_played"
    t.integer  "twostaken"
    t.integer  "twosmade"
    t.integer  "threestaken"
    t.integer  "threesmade"
    t.integer  "freesmade"
    t.integer  "freestaken"
    t.integer  "oreb"
    t.integer  "dreb"
    t.integer  "assists"
    t.integer  "turnovers"
    t.integer  "steals"
    t.integer  "blocks"
    t.integer  "fouls"
    t.integer  "plusminus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "statistics", ["game_id"], name: "index_statistics_on_game_id"
  add_index "statistics", ["player_id"], name: "index_statistics_on_player_id"
  add_index "statistics", ["team_id"], name: "index_statistics_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.text     "city"
    t.text     "nickname"
    t.text     "abbreviation"
    t.integer  "nbacomid"
    t.integer  "division_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "teams", ["division_id"], name: "index_teams_on_division_id"

end
