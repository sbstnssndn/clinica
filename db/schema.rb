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

ActiveRecord::Schema.define(version: 2020_09_25_182758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_foreign_key "exam_selections", "batteries"
  add_foreign_key "exam_selections", "exams"
end
