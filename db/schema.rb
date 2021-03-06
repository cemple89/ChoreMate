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

ActiveRecord::Schema.define(version: 20161028190429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.string "address",  null: false
    t.string "city",     null: false
    t.string "state",    null: false
    t.string "zip_code", null: false
  end

  create_table "chores", force: :cascade do |t|
    t.string   "name",                null: false
    t.integer  "completion_interval", null: false
    t.integer  "apartment_id",        null: false
    t.integer  "user_id"
    t.datetime "last_completed"
    t.datetime "due_by"
    t.integer  "points",              null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["apartment_id"], name: "index_chores_on_apartment_id", using: :btree
    t.index ["user_id"], name: "index_chores_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                             null: false
    t.integer  "apartment_id"
    t.integer  "chorescore"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "email"
    t.boolean  "admin",            default: false
    t.index ["apartment_id"], name: "index_users_on_apartment_id", using: :btree
  end

end
