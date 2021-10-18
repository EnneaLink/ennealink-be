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

ActiveRecord::Schema.define(version: 2021_10_16_000550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enneagrams", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "myers_briggs", force: :cascade do |t|
    t.string "type_of"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.bigint "myers_brigg_id"
    t.bigint "enneagram_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["enneagram_id"], name: "index_users_on_enneagram_id"
    t.index ["myers_brigg_id"], name: "index_users_on_myers_brigg_id"
  end

  add_foreign_key "friendships", "users"
  add_foreign_key "users", "enneagrams"
  add_foreign_key "users", "myers_briggs"
end
