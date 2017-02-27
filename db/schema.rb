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

ActiveRecord::Schema.define(version: 20170227204244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "details"
    t.integer  "worker_id"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
    t.time     "time"
    t.string   "title"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "worker_id"
    t.integer  "job_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "comments"
  end

  create_table "services", force: :cascade do |t|
    t.integer  "worker_id"
    t.string   "type_of_service"
    t.integer  "price"
    t.time     "time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "trade_id"
  end

  create_table "trades", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone_number"
    t.string   "home_address"
    t.string   "billing_address"
    t.string   "company_name"
    t.string   "trade"
    t.string   "license_plate"
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.integer  "trade_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  end

end
