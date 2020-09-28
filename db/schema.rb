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

ActiveRecord::Schema.define(version: 2020_09_28_211438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  create_table "batteries", force: :cascade do |t|
    t.string "name"
    t.text "certification"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_selections", force: :cascade do |t|
    t.integer "order"
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
    t.index ["appointment_id"], name: "index_reports_on_appointment_id"
    t.index ["patient_id"], name: "index_reports_on_patient_id"
  end

  add_foreign_key "appointment_batteries", "appointments"
  add_foreign_key "appointment_batteries", "batteries"
  add_foreign_key "appointment_patients", "appointments"
  add_foreign_key "appointment_patients", "patients"
  add_foreign_key "exam_selections", "batteries"
  add_foreign_key "exam_selections", "exams"
  add_foreign_key "form_values", "form_fields"
  add_foreign_key "reports", "appointments"
  add_foreign_key "reports", "patients"
end
