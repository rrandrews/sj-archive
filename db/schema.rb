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

ActiveRecord::Schema.define(version: 20160824075726) do

  create_table "boards", force: :cascade do |t|
    t.integer  "round"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_boards_on_game_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "clues", force: :cascade do |t|
    t.integer  "column_id"
    t.integer  "position"
    t.string   "clue"
    t.string   "response"
    t.integer  "category_id"
    t.boolean  "is_dd"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_clues_on_category_id"
    t.index ["column_id"], name: "index_clues_on_column_id"
  end

  create_table "columns", force: :cascade do |t|
    t.integer  "position"
    t.integer  "board_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.index ["board_id"], name: "index_columns_on_board_id"
    t.index ["category_id"], name: "index_columns_on_category_id"
  end

  create_table "games", force: :cascade do |t|
    t.date     "air_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "season"
    t.integer  "episode"
    t.string   "title"
  end

end
