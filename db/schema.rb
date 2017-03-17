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

ActiveRecord::Schema.define(version: 20170317192311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "house_number"
    t.integer  "unit_number"
    t.string   "street"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "worker_id"
    t.integer  "service_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "title"
    t.text     "note"
    t.string   "state",         default: "pending"
    t.datetime "job_closed"
    t.datetime "work_finsihed"
    t.datetime "datetime"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "comment"
    t.integer  "worker_id"
  end

  create_table "services", force: :cascade do |t|
    t.string   "type_of_service"
    t.integer  "price"
    t.time     "time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "trade_id"
  end

  create_table "services_users", force: :cascade do |t|
    t.integer "worker_id"
    t.integer "services_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.string   "trade_requested"
    t.string   "deliverables_requested"
    t.string   "about_worker"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "request_state",          default: "none"
    t.integer  "user_id"
  end

  create_table "trades", force: :cascade do |t|
    t.string "name"
    t.string "category"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "license_plate"
    t.string   "email",                                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "role",                         default: "client"
    t.integer  "trade_id"
    t.bigint   "phone_number"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  end

end
