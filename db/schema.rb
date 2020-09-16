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

ActiveRecord::Schema.define(version: 2020_09_16_154808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrative_profiles", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "fecha"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "battery_selections", force: :cascade do |t|
    t.bigint "appointment_id"
    t.bigint "exam_battery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_battery_selections_on_appointment_id"
    t.index ["exam_battery_id"], name: "index_battery_selections_on_exam_battery_id"
  end

  create_table "business_profiles", force: :cascade do |t|
    t.integer "agreement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_associations", force: :cascade do |t|
    t.integer "order"
    t.bigint "exam_id"
    t.bigint "exam_battery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_battery_id"], name: "index_exam_associations_on_exam_battery_id"
    t.index ["exam_id"], name: "index_exam_associations_on_exam_id"
  end

  create_table "exam_batteries", force: :cascade do |t|
    t.string "name"
    t.string "certification"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_batteries_exams", id: false, force: :cascade do |t|
    t.bigint "exam_id", null: false
    t.bigint "exam_battery_id", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guest_business_profiles", force: :cascade do |t|
    t.string "name"
    t.string "job_title"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guest_person_profiles", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.datetime "birthday"
    t.string "phone"
    t.string "job_title"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.datetime "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "appointment_id"
    t.index ["appointment_id"], name: "index_patients_on_appointment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.string "profile_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "users"
  add_foreign_key "battery_selections", "appointments"
  add_foreign_key "battery_selections", "exam_batteries"
  add_foreign_key "exam_associations", "exam_batteries"
  add_foreign_key "exam_associations", "exams"
  add_foreign_key "patients", "appointments"
end
