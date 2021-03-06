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

ActiveRecord::Schema.define(:version => 20130621173037) do

  create_table "choices", :force => true do |t|
    t.integer  "feedback_id"
    t.integer  "response_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["feedback_id"], :name => "index_choices_on_feedback_id"
  add_index "choices", ["response_id"], :name => "index_choices_on_response_id"

  create_table "feedbacks", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "user_id"
    t.string   "os"
    t.string   "browser"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["survey_id"], :name => "index_feedbacks_on_survey_id"
  add_index "feedbacks", ["user_id"], :name => "index_feedbacks_on_user_id"

  create_table "profiles", :force => true do |t|
    t.date     "birthday"
    t.string   "gender"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "category"
    t.text     "description"
    t.boolean  "private",           :default => false
    t.integer  "user_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "questions", :force => true do |t|
    t.integer  "survey_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["survey_id"], :name => "index_questions_on_survey_id"

  create_table "registrations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["project_id"], :name => "index_registrations_on_project_id"
  add_index "registrations", ["user_id"], :name => "index_registrations_on_user_id"

  create_table "responses", :force => true do |t|
    t.integer  "question_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["question_id"], :name => "index_responses_on_question_id"

  create_table "screenshots", :force => true do |t|
    t.integer  "project_id"
    t.string   "caption"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "screenshots", ["project_id"], :name => "index_screenshots_on_project_id"

  create_table "surveys", :force => true do |t|
    t.integer  "test_phase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveys", ["test_phase_id"], :name => "index_surveys_on_test_phase_id"

  create_table "test_phases", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_phases", ["project_id"], :name => "index_test_phases_on_project_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "access_token"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
