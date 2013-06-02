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

ActiveRecord::Schema.define(version: 20130602154359) do

  create_table "admin_authors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_authors_books", id: false, force: true do |t|
    t.integer "admin_author_id", null: false
    t.integer "book_id",         null: false
  end

  create_table "admin_publishers", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title",                      null: false
    t.integer  "publisher_id",               null: false
    t.integer  "admin_author_id",            null: false
    t.datetime "published_at"
    t.string   "isbn",            limit: 13
    t.text     "blurb"
    t.integer  "page_counter"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
