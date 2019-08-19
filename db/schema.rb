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

ActiveRecord::Schema.define(version: 2019_08_15_011530) do

  create_table "classrooms", force: :cascade do |t|
    t.string "teacher"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fundraisers", force: :cascade do |t|
    t.integer "school_id"
    t.string "title"
    t.decimal "amt_raised", precision: 16, scale: 2
    t.string "status"
    t.integer "goal"
    t.date "date"
    t.string "school_year"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "households", force: :cascade do |t|
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "logo"
    t.string "school_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "grade"
    t.integer "school_id"
    t.integer "household_id"
    t.integer "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "profile_img", default: "/assets/avatar.jpg"
    t.boolean "admin", default: false
    t.integer "school_id"
    t.integer "household_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
