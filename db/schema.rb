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

ActiveRecord::Schema.define(version: 20151023082152) do

  create_table "authentication_tokens", force: :cascade do |t|
    t.string   "name"
    t.string   "device_token"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "authentication_tokens", ["user_id"], name: "index_authentication_tokens_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "alc_percent"
  end

  create_table "drink_benchmarks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drink_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "drink_benchmarks", ["drink_id"], name: "index_drink_benchmarks_on_drink_id"
  add_index "drink_benchmarks", ["user_id"], name: "index_drink_benchmarks_on_user_id"

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
    t.integer  "occasion_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "amount"
  end

  add_index "occasion_drinks", ["drink_id"], name: "index_occasion_drinks_on_drink_id"
  add_index "occasion_drinks", ["occasion_id"], name: "index_occasion_drinks_on_occasion_id"
  add_index "occasion_drinks", ["user_id"], name: "index_occasion_drinks_on_user_id"

  create_table "occasions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "occasions", ["user_id"], name: "index_occasions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "",  null: false
    t.float    "weight",                 default: 0.0, null: false
    t.integer  "age",                    default: 0,   null: false
    t.integer  "gender"
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
