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

ActiveRecord::Schema.define(version: 20151230031618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignment_submissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.integer  "points"
    t.datetime "time_submitted"
    t.integer  "grader_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "link"
  end

  add_index "assignment_submissions", ["assignment_id"], name: "index_assignment_submissions_on_assignment_id", using: :btree
  add_index "assignment_submissions", ["grader_id"], name: "index_assignment_submissions_on_grader_id", using: :btree
  add_index "assignment_submissions", ["user_id"], name: "index_assignment_submissions_on_user_id", using: :btree

  create_table "assignments", force: :cascade do |t|
    t.integer  "semester_id"
    t.string   "link"
    t.string   "name"
    t.integer  "category",    default: 0
    t.float    "weight",      default: 1.0
    t.integer  "points"
    t.datetime "deadline"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "assignments", ["semester_id"], name: "index_assignments_on_semester_id", using: :btree

  create_table "check_in_codes", force: :cascade do |t|
    t.string   "code"
    t.date     "class_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled",    default: false
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
    t.string   "title"
    t.string   "partial"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semester_id"
  end

  create_table "positions", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "semester_id"
    t.integer  "position_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "semester"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "lower_division_limit"
    t.integer  "upper_division_limit"
    t.datetime "application_deadline"
    t.datetime "acceptance_release_date"
  end

  create_table "student_applications", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "year"
    t.string   "major"
    t.string   "gpa"
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
    t.integer  "standing",                  default: 0
    t.integer  "status",                    default: 0
    t.integer  "sid"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "nickname"
    t.string   "image_url"
    t.text     "bio"
    t.string   "blog"
    t.string   "location"
    t.boolean  "enabled",                default: false
    t.integer  "standing",               default: 0
    t.integer  "sid"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "assignment_submissions", "assignments"
  add_foreign_key "assignment_submissions", "users"
  add_foreign_key "assignments", "semesters"
end
