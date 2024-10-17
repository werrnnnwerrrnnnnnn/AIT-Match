# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_17_051302) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "degrees", force: :cascade do |t|
    t.string "value"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "value"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mbtis", force: :cascade do |t|
    t.string "value"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferred_genders", force: :cascade do |t|
    t.string "value"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferred_mbtis", force: :cascade do |t|
    t.string "value"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferred_relationships", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_interests", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "interest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_profile_interests_on_interest_id"
    t.index ["profile_id"], name: "index_profile_interests_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.integer "age"
    t.bigint "mbti_id", null: false
    t.bigint "gender_id", null: false
    t.bigint "degree_id", null: false
    t.bigint "school_id", null: false
    t.bigint "program_id", null: false
    t.text "educational_background"
    t.text "profile_picture_url"
    t.integer "preferred_min_age"
    t.integer "preferred_max_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthday"
    t.index ["degree_id"], name: "index_profiles_on_degree_id"
    t.index ["gender_id"], name: "index_profiles_on_gender_id"
    t.index ["mbti_id"], name: "index_profiles_on_mbti_id"
    t.index ["program_id"], name: "index_profiles_on_program_id"
    t.index ["school_id"], name: "index_profiles_on_school_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
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
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "profile_interests", "interests"
  add_foreign_key "profile_interests", "profiles"
  add_foreign_key "profiles", "degrees"
  add_foreign_key "profiles", "genders"
  add_foreign_key "profiles", "mbtis"
  add_foreign_key "profiles", "programs"
  add_foreign_key "profiles", "schools"
  add_foreign_key "profiles", "users"
end
