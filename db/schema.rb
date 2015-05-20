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

ActiveRecord::Schema.define(version: 20150520225756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_in_codes", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.date     "class_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled",                default: false
  end

  create_table "check_ins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "check_in_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evaluations", force: :cascade do |t|
    t.text     "decision"
    t.integer  "user_id"
    t.integer  "student_application_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "evaluations", ["student_application_id"], name: "index_evaluations_on_student_application_id", using: :btree
  add_index "evaluations", ["user_id"], name: "index_evaluations_on_user_id", using: :btree

  create_table "lectures", force: :cascade do |t|
    t.integer  "number"
    t.string   "title",       limit: 255
    t.string   "partial",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semester_id"
  end

  create_table "positions", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "semester_id"
    t.integer  "position_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "semester",   limit: 255
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url",        limit: 255
  end

  create_table "student_applications", force: :cascade do |t|
    t.string   "first_name",                limit: 255
    t.string   "last_name",                 limit: 255
    t.string   "email",                     limit: 255
    t.string   "phone_number",              limit: 255
    t.string   "year",                      limit: 255
    t.string   "major",                     limit: 255
    t.string   "gpa",                       limit: 255
    t.text     "why_join"
    t.text     "cs_classes_taken"
    t.text     "current_courseload"
    t.text     "other_commitments"
    t.text     "how_did_you_hear_about_us"
    t.text     "how_many_hours_willing"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "semester_id"
    t.integer  "standing",                              default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "name",                   limit: 255
    t.string   "nickname",               limit: 255
    t.string   "image_url",              limit: 255
    t.text     "bio"
    t.string   "blog",                   limit: 255
    t.string   "location",               limit: 255
    t.boolean  "enabled",                            default: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
