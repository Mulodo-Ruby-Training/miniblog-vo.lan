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

ActiveRecord::Schema.define(version: 20150313160715) do

  create_table "category", force: :cascade do |t|
    t.string   "name",      limit: 45,                 null: false
    t.integer  "parent_id", limit: 4
    t.boolean  "status",    limit: 1,  default: false, null: false
    t.datetime "create_at",                            null: false
    t.datetime "update_at",                            null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comment", force: :cascade do |t|
    t.text     "content",   limit: 255,             null: false
    t.integer  "user_id",   limit: 4,               null: false
    t.integer  "post_id",   limit: 4,               null: false
    t.integer  "parent_id", limit: 4,               null: false
    t.integer  "status",    limit: 1,   default: 1, null: false
    t.datetime "create_at",                         null: false
    t.datetime "update_at",                         null: false
  end

  create_table "post_to_catelogry", id: false, force: :cascade do |t|
    t.integer "category_id", limit: 4, null: false
    t.integer "post_id",     limit: 4, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",              limit: 200,                   null: false
    t.text     "content",            limit: 65535,                 null: false
    t.text     "description",        limit: 65535,                 null: false
    t.integer  "user_id",            limit: 4,                     null: false
    t.boolean  "status",             limit: 1,     default: false, null: false
    t.datetime "create_at",                                        null: false
    t.datetime "update_at",                                        null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "posts", ["title"], name: "title", unique: true, using: :btree

  create_table "timestamps", id: false, force: :cascade do |t|
    t.datetime "create_time"
    t.datetime "update_time"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",     limit: 40,                    null: false
    t.string   "password",     limit: 100,                   null: false
    t.string   "first_name",   limit: 50,                    null: false
    t.string   "last_name",    limit: 50,                    null: false
    t.string   "avatar",       limit: 100,                   null: false
    t.boolean  "gender",       limit: 1,   default: true,    null: false
    t.string   "permission",   limit: 5,   default: "11000", null: false
    t.string   "email",        limit: 50,                    null: false
    t.string   "display_name", limit: 50
    t.string   "birthday",     limit: 10,                    null: false
    t.boolean  "status",       limit: 1,   default: false,   null: false
    t.datetime "create_at",                                  null: false
    t.datetime "update_at",                                  null: false
  end

  add_index "users", ["display_name"], name: "display_name", unique: true, using: :btree
  add_index "users", ["email"], name: "email", unique: true, using: :btree
  add_index "users", ["username"], name: "username", unique: true, using: :btree

end
