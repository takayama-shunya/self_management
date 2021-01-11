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

ActiveRecord::Schema.define(version: 2021_01_11_083552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "condition_comments", force: :cascade do |t|
    t.bigint "condition_id"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_condition_comments_on_condition_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.time "retirung_time", null: false
    t.integer "sleep_time", null: false
    t.integer "sleep_quality", null: false
    t.integer "meal_count", null: false
    t.integer "stress_level", null: false
    t.integer "toughness", null: false
    t.integer "stress_recovery_balance", null: false
    t.integer "positive_level", null: false
    t.integer "enrichment_happiness_level", null: false
    t.string "negative_comment"
    t.string "positive_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.time "rising_time", null: false
    t.index ["created_at"], name: "index_conditions_on_created_at"
    t.index ["user_id"], name: "index_conditions_on_user_id"
  end

  create_table "record_comments", force: :cascade do |t|
    t.bigint "setting_record_id"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setting_record_id"], name: "index_record_comments_on_setting_record_id"
  end

  create_table "setting_records", force: :cascade do |t|
    t.string "type"
    t.string "title", null: false
    t.string "unit", null: false
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_setting_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "week_days", force: :cascade do |t|
    t.integer "integer_record_id"
    t.integer "decimal_record_id"
    t.integer "time_record_id"
    t.integer "check_record_id"
    t.integer "count_record_id"
    t.integer "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["week_id"], name: "index_week_days_on_week_id"
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "dayname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "condition_comments", "conditions"
  add_foreign_key "conditions", "users"
  add_foreign_key "record_comments", "setting_records"
  add_foreign_key "setting_records", "users"
end
