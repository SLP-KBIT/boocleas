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

ActiveRecord::Schema.define(version: 20140506172401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "biblios", force: true do |t|
    t.integer  "book_id"
    t.integer  "shelf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registrant_id"
  end

  add_index "biblios", ["book_id"], name: "index_biblios_on_book_id", using: :btree
  add_index "biblios", ["shelf_id"], name: "index_biblios_on_shelf_id", using: :btree

  create_table "books", force: true do |t|
    t.string   "isbn"
    t.text     "author"
    t.string   "publisher"
    t.text     "genre"
    t.text     "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "title"
    t.datetime "published_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "max_lent_week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lent_histories", force: true do |t|
    t.integer  "biblio_id"
    t.integer  "user_id"
    t.datetime "will_return_at"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lent_histories", ["biblio_id"], name: "index_lent_histories_on_biblio_id", using: :btree
  add_index "lent_histories", ["user_id"], name: "index_lent_histories_on_user_id", using: :btree

  create_table "shelves", force: true do |t|
    t.text     "genre"
    t.string   "room"
    t.text     "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "uid",                    default: "", null: false
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
    t.text     "gecos"
    t.boolean  "is_admin"
    t.boolean  "is_lendable"
    t.integer  "group_id"
  end

  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

end
