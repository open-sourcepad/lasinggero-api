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

ActiveRecord::Schema.define(version: 20151023035400) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drinks", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.float    "alc_percent"
    t.float    "serving"
    t.string   "serving_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "drinks", ["category_id"], name: "index_drinks_on_category_id"

  create_table "occasion_drinks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drink_id"
    t.integer  "ocassion_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "occasion_drinks", ["drink_id"], name: "index_occasion_drinks_on_drink_id"
  add_index "occasion_drinks", ["ocassion_id"], name: "index_occasion_drinks_on_ocassion_id"
  add_index "occasion_drinks", ["user_id"], name: "index_occasion_drinks_on_user_id"

  create_table "occasions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "occasions", ["user_id"], name: "index_occasions_on_user_id"

end