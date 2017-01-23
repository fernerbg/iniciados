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

ActiveRecord::Schema.define(version: 20170123033908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audios", force: true do |t|
    t.string   "name"
    t.integer  "length"
    t.string   "wave"
    t.string   "track"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["level_id"], :name => "index_books_on_level_id"
    t.foreign_key ["level_id"], "levels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_books_level_id"
  end

  create_table "sections", force: true do |t|
    t.string   "title"
    t.integer  "start_page"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["book_id"], :name => "index_sections_on_book_id"
    t.index ["start_page"], :name => "index_sections_on_start_page"
    t.foreign_key ["book_id"], "books", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_sections_book_id"
  end

  create_table "chapters", force: true do |t|
    t.string   "title"
    t.integer  "start_page"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["section_id"], :name => "index_chapters_on_section_id"
    t.index ["start_page"], :name => "index_chapters_on_start_page"
    t.foreign_key ["section_id"], "sections", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_chapters_section_id"
  end

  create_table "configurations", force: true do |t|
    t.text     "name"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "headquarters", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_levels", force: true do |t|
    t.string   "name"
    t.integer  "number"
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

  create_table "level_audios", force: true do |t|
    t.integer  "level_id"
    t.integer  "audio_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["audio_id"], :name => "index_level_audios_on_audio_id"
    t.index ["level_id"], :name => "index_level_audios_on_level_id"
    t.foreign_key ["audio_id"], "audios", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_level_audios_audio_id"
    t.foreign_key ["level_id"], "levels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_level_audios_level_id"
  end

  create_table "level_sections", force: true do |t|
    t.integer  "section_id"
    t.integer  "level_id"
    t.integer  "front_number"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["front_number"], :name => "index_level_sections_on_front_number"
    t.index ["level_id"], :name => "index_level_sections_on_level_id"
    t.index ["section_id"], :name => "index_level_sections_on_section_id"
    t.foreign_key ["level_id"], "levels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_level_sections_level_id"
    t.foreign_key ["section_id"], "sections", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_level_sections_section_id"
  end

  create_table "notifications", force: true do |t|
    t.string   "title"
    t.datetime "date"
    t.text     "description"
    t.string   "media"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["date"], :name => "index_notifications_on_date"
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
    t.string   "name"
    t.string   "surname"
    t.integer  "lesson_id"
    t.integer  "level_id"
    t.integer  "headquarter_id"
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["headquarter_id"], :name => "index_users_on_headquarter_id"
    t.index ["lesson_id"], :name => "index_users_on_lesson_id"
    t.index ["level_id"], :name => "index_users_on_level_id"
    t.index ["name"], :name => "index_users_on_name"
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
    t.foreign_key ["headquarter_id"], "headquarters", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_users_headquarter_id"
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

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string   "name"
    t.integer  "length"
    t.string   "cover"
    t.string   "track"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
