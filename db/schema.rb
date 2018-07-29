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

ActiveRecord::Schema.define(version: 20180719012324) do

  create_table "lecture_categories", force: :cascade do |t|
    t.string   "lec_category"
    t.integer  "lecture_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "lecturer_categories", force: :cascade do |t|
    t.string   "category"
    t.integer  "lecturer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lecturers", force: :cascade do |t|
    t.string   "lec_id",     null: false
    t.string   "pw",         null: false
    t.string   "name"
    t.string   "sex"
    t.integer  "age"
    t.integer  "career"
    t.string   "phone"
    t.string   "email"
    t.string   "region"
    t.text     "intro"
    t.string   "lec_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lecturers", ["lec_id"], name: "index_lecturers_on_lec_id", unique: true

  create_table "lectures", force: :cascade do |t|
    t.string   "title"
    t.text     "intro"
    t.date     "time"
    t.string   "subject"
    t.integer  "rate"
    t.string   "lec_poster"
    t.integer  "lecturer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "sex"
    t.integer  "age"
    t.text     "background"
    t.integer  "point"
    t.boolean  "recommend"
    t.text     "content"
    t.integer  "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
