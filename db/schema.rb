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

ActiveRecord::Schema.define(version: 20140417165613) do

  create_table "biblios", force: true do |t|
    t.integer  "book_id"
    t.integer  "shelf_id"
    t.string   "registrant"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "biblios", ["book_id"], name: "index_biblios_on_book_id", using: :btree
  add_index "biblios", ["shelf_id"], name: "index_biblios_on_shelf_id", using: :btree

  create_table "books", force: true do |t|
    t.string   "isbn"
    t.text     "author"
    t.integer  "published_at"
    t.string   "publisheder"
    t.text     "genre"
    t.text     "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shelves", force: true do |t|
    t.text     "genre"
    t.string   "room"
    t.text     "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
