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

ActiveRecord::Schema.define(version: 2020_10_08_195444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "number"
    t.string "bank"
    t.string "email"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_accounts_on_branch_id"
  end

  create_table "appointment_batteries", force: :cascade do |t|
    t.bigint "appointment_id"
    t.bigint "battery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_appointment_batteries_on_appointment_id"
    t.index ["battery_id"], name: "index_appointment_batteries_on_battery_id"
  end

  create_table "appointment_patients", force: :cascade do |t|
    t.bigint "appointment_id"
    t.bigint "patient_id"
    t.boolean "ecg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_appointment_patients_on_appointment_id"
    t.index ["patient_id"], name: "index_appointment_patients_on_patient_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "batteries", force: :cascade do |t|
    t.string "name"
    t.text "certification"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "visible", default: true
  end

  create_table "battery_offerings", force: :cascade do |t|
    t.string "price"
    t.bigint "battery_id"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_id"], name: "index_battery_offerings_on_battery_id"
    t.index ["branch_id"], name: "index_battery_offerings_on_branch_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.text "health_permit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_profiles", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.bigint "branch_id"
    t.boolean "payment_agreement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_business_profiles_on_branch_id"
  end

  create_table "ceso_profiles", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_ceso_profiles_on_branch_id"
  end

  create_table "documents", force: :cascade do |t|
    t.text "description"
    t.bigint "form_value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.index ["form_value_id"], name: "index_documents_on_form_value_id"
  end

  create_table "exam_selections", force: :cascade do |t|
    t.integer "order", default: 1
    t.bigint "exam_id"
    t.bigint "battery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_id"], name: "index_exam_selections_on_battery_id"
    t.index ["exam_id", "battery_id"], name: "index_exam_selections_on_exam_id_and_battery_id", unique: true
    t.index ["exam_id"], name: "index_exam_selections_on_exam_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_fields", force: :cascade do |t|
    t.string "label"
    t.boolean "required", default: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "formable_id"
    t.string "formable_type"
    t.integer "min"
    t.integer "max"
    t.integer "length"
  end

  create_table "form_values", force: :cascade do |t|
    t.text "value"
    t.bigint "form_field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "submittable_id"
    t.string "submittable_type"
    t.index ["form_field_id"], name: "index_form_values_on_form_field_id"
  end

  create_table "guest_business_profiles", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "position"
    t.string "phone"
    t.string "business_name"
    t.text "business_address"
    t.string "business_rut"
    t.string "business_activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "label"
    t.string "value"
    t.bigint "form_field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_field_id"], name: "index_options_on_form_field_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.boolean "completed"
    t.bigint "patient_id"
    t.text "conclusions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "appointment_id"
    t.jsonb "snapshot"
    t.index ["appointment_id"], name: "index_reports_on_appointment_id"
    t.index ["patient_id"], name: "index_reports_on_patient_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.integer "profile_id"
    t.string "profile_type"
    t.boolean "approved", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile_id", "profile_type"], name: "index_users_on_profile_id_and_profile_type"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "accounts", "branches"
  add_foreign_key "appointment_batteries", "appointments"
  add_foreign_key "appointment_batteries", "batteries"
  add_foreign_key "appointment_patients", "appointments"
  add_foreign_key "appointment_patients", "patients"
  add_foreign_key "appointments", "users"
  add_foreign_key "battery_offerings", "batteries"
  add_foreign_key "battery_offerings", "branches"
  add_foreign_key "business_profiles", "branches"
  add_foreign_key "ceso_profiles", "branches"
  add_foreign_key "documents", "form_values"
  add_foreign_key "exam_selections", "batteries"
  add_foreign_key "exam_selections", "exams"
  add_foreign_key "form_values", "form_fields"
  add_foreign_key "options", "form_fields"
  add_foreign_key "reports", "appointments"
  add_foreign_key "reports", "patients"
  add_foreign_key "users", "roles"
end
