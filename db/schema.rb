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

ActiveRecord::Schema.define(version: 20160920104007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hotel_overviews", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "post_type"
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
  end

  add_index "room_types", ["parent_room_type_id"], name: "index_room_types_on_parent_room_type_id", using: :btree

  add_foreign_key "photo_of_rooms", "room_types"
  add_foreign_key "photo_overviews", "hotel_overviews"
  add_foreign_key "room_types", "parent_room_types"
end
