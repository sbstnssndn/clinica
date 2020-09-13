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

ActiveRecord::Schema.define(version: 2020_09_12_214527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exam_associations", "exam_batteries"
  add_foreign_key "exam_associations", "exams"
end
