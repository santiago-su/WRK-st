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

ActiveRecord::Schema.define(version: 20140925225115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "charges", force: true do |t|
    t.date     "date"
    t.integer  "client_id"
    t.decimal  "quantity",   precision: 14, scale: 2
    t.string   "concept"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charges", ["client_id"], name: "index_charges_on_client_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "responsible"
    t.string   "email"
    t.string   "description"
    t.string   "phone"
    t.integer  "meeting_office_hours"
    t.date     "entry_date"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["location_id"], name: "index_clients_on_location_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["client_id"], name: "index_locations_on_client_id", using: :btree

  create_table "payments", force: true do |t|
    t.date     "date"
    t.decimal  "quantity",   precision: 14, scale: 2
    t.integer  "client_id"
    t.string   "concept"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["client_id"], name: "index_payments_on_client_id", using: :btree

  create_table "transactions", force: true do |t|
    t.decimal  "amount",              precision: 14, scale: 2
    t.string   "type_of_transaction"
    t.string   "concept"
    t.string   "commentary"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
