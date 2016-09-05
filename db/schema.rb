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

ActiveRecord::Schema.define(version: 20160904164127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appearances", force: :cascade do |t|
    t.integer  "episode_id"
    t.integer  "contestant_id"
    t.integer  "position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["contestant_id"], name: "index_appearances_on_contestant_id", using: :btree
    t.index ["episode_id"], name: "index_appearances_on_episode_id", using: :btree
  end

  create_table "boards", force: :cascade do |t|
    t.integer  "round"
    t.integer  "episode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode_id"], name: "index_boards_on_episode_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "clues", force: :cascade do |t|
    t.integer  "column_id"
    t.integer  "position"
    t.string   "clue"
    t.string   "correct_response"
    t.integer  "category_id"
    t.boolean  "is_dd"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "is_fj"
    t.string   "attachment"
    t.string   "image_url"
    t.string   "note"
    t.integer  "pick_order"
    t.integer  "dd_wager"
    t.index ["category_id"], name: "index_clues_on_category_id", using: :btree
    t.index ["column_id"], name: "index_clues_on_column_id", using: :btree
  end

  create_table "columns", force: :cascade do |t|
    t.integer  "position"
    t.integer  "board_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.index ["board_id"], name: "index_columns_on_board_id", using: :btree
    t.index ["category_id"], name: "index_columns_on_category_id", using: :btree
  end

  create_table "contestants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.date     "air_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "season"
    t.integer  "episode"
    t.string   "title"
    t.integer  "final_id"
    t.boolean  "is_public"
    t.integer  "owner_id"
    t.index ["final_id"], name: "index_episodes_on_final_id", using: :btree
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "contestant_id"
    t.integer  "clue_id"
    t.string   "response"
    t.boolean  "is_correct"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "wager"
    t.index ["clue_id"], name: "index_responses_on_clue_id", using: :btree
    t.index ["contestant_id"], name: "index_responses_on_contestant_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appearances", "contestants"
  add_foreign_key "appearances", "episodes"
  add_foreign_key "boards", "episodes"
  add_foreign_key "clues", "categories"
  add_foreign_key "clues", "columns"
  add_foreign_key "columns", "boards"
  add_foreign_key "columns", "categories"
  add_foreign_key "episodes", "clues", column: "final_id"
  add_foreign_key "episodes", "users", column: "owner_id"
  add_foreign_key "responses", "clues"
  add_foreign_key "responses", "contestants"
end
