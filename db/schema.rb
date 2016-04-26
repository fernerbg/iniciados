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

ActiveRecord::Schema.define(version: 20160204164654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "type"
    t.text     "thumbnail"
    t.text     "url"
    t.integer  "page_number"
    t.string   "file"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["tag_id"], :name => "index_contents_on_tag_id"
    t.foreign_key ["tag_id"], "tags", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_contents_tag_id"
  end

  create_table "countries", force: true do |t|
    t.string   "name",       null: false
    t.string   "iso",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["iso"], :name => "index_countries_on_iso", :unique => true
    t.index ["name"], :name => "index_countries_on_name", :unique => true
  end

  create_table "lesson_levels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "number_level"
    t.integer  "number"
    t.integer  "lesson_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["lesson_level_id"], :name => "index_lessons_on_lesson_level_id"
    t.foreign_key ["lesson_level_id"], "lesson_levels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_lessons_lesson_level_id"
  end

  create_table "lesson_contents", force: true do |t|
    t.integer  "lesson_id"
    t.integer  "content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["content_id"], :name => "index_lesson_contents_on_content_id"
    t.index ["lesson_id"], :name => "index_lesson_contents_on_lesson_id"
    t.foreign_key ["content_id"], "contents", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_lesson_contents_content_id"
    t.foreign_key ["lesson_id"], "lessons", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_lesson_contents_lesson_id"
  end

  create_table "levels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "level_contents", force: true do |t|
    t.integer  "level_id"
    t.integer  "content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["content_id"], :name => "index_level_contents_on_content_id"
    t.index ["level_id"], :name => "index_level_contents_on_level_id"
    t.foreign_key ["content_id"], "contents", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_level_contents_content_id"
    t.foreign_key ["level_id"], "levels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_level_contents_level_id"
  end

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "country_id"
    t.string   "name"
    t.string   "surname"
    t.integer  "lesson_id"
    t.integer  "level_id"
    t.string   "gender"
    t.index ["country_id"], :name => "index_users_on_country_id"
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["lesson_id"], :name => "index_users_on_lesson_id"
    t.index ["level_id"], :name => "index_users_on_level_id"
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
    t.foreign_key ["country_id"], "countries", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_users_country_id"
    t.foreign_key ["lesson_id"], "lessons", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_users_lesson_id"
    t.foreign_key ["level_id"], "levels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_users_level_id"
  end

  create_table "roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["profile_id"], :name => "index_roles_on_profile_id"
    t.index ["user_id"], :name => "index_roles_on_user_id"
    t.foreign_key ["profile_id"], "profiles", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_roles_profile_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_roles_user_id"
  end

end
