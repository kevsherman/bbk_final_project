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

ActiveRecord::Schema.define(version: 20140621013150) do

  create_table "assignments", force: true do |t|
    t.integer  "guest_id"
    t.integer  "sub_event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", force: true do |t|
    t.integer  "main_event_id"
    t.string   "email"
    t.string   "first"
    t.string   "last"
    t.boolean  "rsvp",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_events", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "date"
    t.string   "image"
    t.string   "link"
    t.string   "description"
    t.integer  "start_time"
    t.integer  "end_time"
    t.string   "bride_full_name"
    t.string   "groom_full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_events", force: true do |t|
    t.integer  "main_event_id"
    t.string   "title"
    t.string   "location"
    t.string   "description"
    t.string   "start_time"
    t.string   "end_time"
    t.string   "attire"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
