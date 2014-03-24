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

ActiveRecord::Schema.define(version: 20140322053059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: true do |t|
    t.text     "sl_no"
    t.string   "question"
    t.text     "option_a"
    t.text     "option_b"
    t.text     "option_c"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "answer"
    t.integer  "topic_id"
  end

  add_index "questions", ["topic_id"], name: "index_questions_on_topic_id", using: :btree

  create_table "roles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role_name"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles_users", ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", using: :btree

  create_table "scores", force: true do |t|
    t.integer  "student_id"
    t.integer  "question_id"
    t.string   "option"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "qualification"
    t.integer  "age"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

  create_table "topic_questions", force: true do |t|
    t.integer  "question_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "topic_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
