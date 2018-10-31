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

ActiveRecord::Schema.define(version: 2018_10_30_143319) do

  create_table "activities", force: :cascade do |t|
    t.string "desc"
    t.integer "max_temp"
    t.integer "min_temp"
    t.integer "max_wind_speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_conditions", force: :cascade do |t|
    t.integer "condition_id"
    t.integer "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.integer "code"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.string "zip"
    t.string "date"
    t.string "main"
    t.string "desc"
    t.string "icon"
    t.integer "code"
    t.float "temp"
    t.float "humidity"
    t.float "wind_speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
