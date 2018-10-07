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

ActiveRecord::Schema.define(version: 2018_10_03_153236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conference_rooms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", primary_key: "emp_id", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees_meetings", id: false, force: :cascade do |t|
    t.bigint "meeting_id"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_employees_meetings_on_employee_id"
    t.index ["meeting_id"], name: "index_employees_meetings_on_meeting_id"
  end

  create_table "employees_teams", id: false, force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_employees_teams_on_employee_id"
    t.index ["team_id"], name: "index_employees_teams_on_team_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.bigint "conference_room_id"
    t.integer "booked_by", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.string "title", null: false
    t.text "agenda"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_room_id"], name: "index_meetings_on_conference_room_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
