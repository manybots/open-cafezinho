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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120223221406) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coffee_types", :force => true do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drinks", :force => true do |t|
    t.integer  "machine_id"
    t.integer  "coffee_type_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", :force => true do |t|
    t.integer  "drink_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machines", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "slug"
    t.integer  "brand_id"
    t.integer  "user_id"
    t.boolean  "is_public"
    t.boolean  "is_codebits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
  end

  add_index "machines", ["slug"], :name => "index_machines_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.datetime "remember_created_at"
    t.string   "name"
    t.string   "email"
    t.string   "manybots_user_id"
    t.string   "manybots_avatar_url"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["manybots_user_id"], :name => "index_users_on_manybots_user_id", :unique => true

end
