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

ActiveRecord::Schema.define(version: 20160425172132) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.integer  "author"
    t.integer  "ilustrator"
    t.integer  "photographer"
    t.string   "gender"
    t.string   "subject"
    t.integer  "magazineId"
    t.integer  "colorist"
    t.integer  "totalpages"
    t.string   "pdf"
    t.string   "thematicdesing"
    t.string   "original"
    t.string   "originallocation"
    t.string   "section"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.integer  "year"
    t.integer  "author"
    t.integer  "ilustrator"
    t.integer  "photographer"
    t.integer  "totalpages"
    t.string   "format"
    t.integer  "editor"
    t.integer  "editionyear"
    t.string   "editora"
    t.string   "isbn"
    t.string   "binding"
    t.string   "realisation"
    t.integer  "designer"
    t.string   "correction"
    t.string   "clasification"
    t.string   "content"
    t.string   "banner"
    t.string   "troquelado"
    t.string   "collection"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "magazines", force: :cascade do |t|
    t.integer  "number"
    t.string   "month"
    t.integer  "year"
    t.integer  "cd"
    t.string   "issn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
