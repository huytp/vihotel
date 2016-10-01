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

ActiveRecord::Schema.define(version: 20161001073434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "phone"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "hotel_overviews", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "post_type"
  end

  create_table "offers", force: :cascade do |t|
    t.string   "title"
    t.string   "summary"
    t.text     "content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "friendly"
  end

  create_table "parent_room_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_of_rooms", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "room_type_id"
  end

  add_index "photo_of_rooms", ["room_type_id"], name: "index_photo_of_rooms_on_room_type_id", using: :btree

  create_table "photo_overviews", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "hotel_overview_id"
  end

  add_index "photo_overviews", ["hotel_overview_id"], name: "index_photo_overviews_on_hotel_overview_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "post_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "friendly"
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "full_name"
    t.string   "phone"
    t.string   "email"
    t.string   "company"
    t.string   "address"
    t.datetime "check_in"
    t.datetime "check_out"
    t.string   "room_type"
    t.integer  "number_of_room"
    t.integer  "number_adult"
    t.integer  "number_children"
    t.text     "requirement"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "room_features", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_types", force: :cascade do |t|
    t.string   "room_type_name"
    t.text     "description"
    t.string   "room_size"
    t.string   "room_bed"
    t.string   "room_view"
    t.string   "room_features"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "parent_room_type_id"
    t.string   "friendly"
    t.integer  "cost"
  end

  add_index "room_types", ["parent_room_type_id"], name: "index_room_types_on_parent_room_type_id", using: :btree

  add_foreign_key "photo_of_rooms", "room_types"
  add_foreign_key "photo_overviews", "hotel_overviews"
  add_foreign_key "room_types", "parent_room_types"
end
