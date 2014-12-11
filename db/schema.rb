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

ActiveRecord::Schema.define(version: 20141211214517) do

  create_table "answers", force: true do |t|
    t.integer  "question_id", null: false
    t.string   "value",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "questions", force: true do |t|
    t.integer  "section_id", null: false
    t.integer  "type_id",    null: false
    t.text     "text",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["section_id"], name: "index_questions_on_section_id"
  add_index "questions", ["type_id"], name: "index_questions_on_type_id"

  create_table "response_sets", force: true do |t|
    t.integer  "survey_id",                 null: false
    t.integer  "user_id",                   null: false
    t.boolean  "incomplete", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "response_sets", ["survey_id"], name: "index_response_sets_on_survey_id"
  add_index "response_sets", ["user_id"], name: "index_response_sets_on_user_id"

  create_table "responses", force: true do |t|
    t.integer  "response_set_id", null: false
    t.integer  "answer_id",       null: false
    t.text     "text_value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id",     null: false
  end

  add_index "responses", ["answer_id"], name: "index_responses_on_answer_id"
  add_index "responses", ["question_id"], name: "index_responses_on_question_id"
  add_index "responses", ["response_set_id"], name: "index_responses_on_response_set_id"

  create_table "roles", force: true do |t|
    t.string   "name",       limit: 20, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "survey_id",             null: false
    t.integer  "order",                 null: false
    t.string   "slug",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 20, null: false
  end

  add_index "sections", ["survey_id"], name: "index_sections_on_survey_id"

  create_table "surveys", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.datetime "active_from"
    t.datetime "active_until"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name",       limit: 20, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "role_id"
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
