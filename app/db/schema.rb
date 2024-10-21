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

ActiveRecord::Schema[7.2].define(version: 2024_10_21_124609) do
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

  create_table "matches", force: :cascade do |t|
    t.bigint "requestor_id", null: false
    t.bigint "receiver_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_matches_on_receiver_id"
    t.index ["requestor_id", "receiver_id"], name: "index_matches_on_requestor_id_and_receiver_id", unique: true
    t.index ["requestor_id"], name: "index_matches_on_requestor_id"
  end

  create_table "mbtis", force: :cascade do |t|
    t.string "value"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "preferred_min_age"
    t.integer "preferred_max_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "preferred_degrees", force: :cascade do |t|
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

  create_table "preferred_interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferred_mbtis", force: :cascade do |t|
    t.string "value"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferred_programs", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferred_relationships", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferred_schools", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
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

  create_table "profile_preferred_genders", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "gender_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gender_id"], name: "index_profile_preferred_genders_on_gender_id"
    t.index ["profile_id"], name: "index_profile_preferred_genders_on_profile_id"
  end

  create_table "profile_preferred_interests", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "interest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_profile_preferred_interests_on_interest_id"
    t.index ["profile_id"], name: "index_profile_preferred_interests_on_profile_id"
  end

  create_table "profile_preferred_mbtis", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "preferred_mbti_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preferred_mbti_id"], name: "index_profile_preferred_mbtis_on_preferred_mbti_id"
    t.index ["profile_id"], name: "index_profile_preferred_mbtis_on_profile_id"
  end

  create_table "profile_preferred_relationships", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "preferred_relationship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preferred_relationship_id"], name: "idx_on_preferred_relationship_id_54c504a6a3"
    t.index ["profile_id"], name: "index_profile_preferred_relationships_on_profile_id"
  end

  create_table "profile_relationships", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "relationship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_relationships_on_profile_id"
    t.index ["relationship_id"], name: "index_profile_relationships_on_relationship_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.bigint "mbti_id", null: false
    t.bigint "gender_id", null: false
    t.bigint "degree_id", null: false
    t.bigint "school_id", null: false
    t.bigint "program_id", null: false
    t.text "educational_background"
    t.text "profile_picture_url"
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

  create_table "users_preferred_degrees", force: :cascade do |t|
    t.bigint "preference_id", null: false
    t.bigint "preferred_degree_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preference_id"], name: "index_users_preferred_degrees_on_preference_id"
    t.index ["preferred_degree_id"], name: "index_users_preferred_degrees_on_preferred_degree_id"
  end

  create_table "users_preferred_genders", force: :cascade do |t|
    t.bigint "preference_id", null: false
    t.bigint "preferred_gender_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preference_id"], name: "index_users_preferred_genders_on_preference_id"
    t.index ["preferred_gender_id"], name: "index_users_preferred_genders_on_preferred_gender_id"
  end

  create_table "users_preferred_interests", force: :cascade do |t|
    t.bigint "preference_id", null: false
    t.bigint "preferred_interest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preference_id"], name: "index_users_preferred_interests_on_preference_id"
    t.index ["preferred_interest_id"], name: "index_users_preferred_interests_on_preferred_interest_id"
  end

  create_table "users_preferred_mbtis", force: :cascade do |t|
    t.bigint "preference_id", null: false
    t.bigint "preferred_mbti_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preference_id"], name: "index_users_preferred_mbtis_on_preference_id"
    t.index ["preferred_mbti_id"], name: "index_users_preferred_mbtis_on_preferred_mbti_id"
  end

  create_table "users_preferred_programs", force: :cascade do |t|
    t.bigint "preference_id", null: false
    t.bigint "preferred_program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preference_id"], name: "index_users_preferred_programs_on_preference_id"
    t.index ["preferred_program_id"], name: "index_users_preferred_programs_on_preferred_program_id"
  end

  create_table "users_preferred_relationships", force: :cascade do |t|
    t.bigint "preference_id", null: false
    t.bigint "preferred_relationship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preference_id"], name: "index_users_preferred_relationships_on_preference_id"
    t.index ["preferred_relationship_id"], name: "idx_on_preferred_relationship_id_395b56ecab"
  end

  create_table "users_preferred_schools", force: :cascade do |t|
    t.bigint "preference_id", null: false
    t.bigint "preferred_school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preference_id"], name: "index_users_preferred_schools_on_preference_id"
    t.index ["preferred_school_id"], name: "index_users_preferred_schools_on_preferred_school_id"
  end

  add_foreign_key "matches", "profiles", column: "receiver_id"
  add_foreign_key "matches", "profiles", column: "requestor_id"
  add_foreign_key "preferences", "users"
  add_foreign_key "profile_interests", "interests"
  add_foreign_key "profile_interests", "profiles"
  add_foreign_key "profile_preferred_genders", "genders"
  add_foreign_key "profile_preferred_genders", "profiles"
  add_foreign_key "profile_preferred_interests", "interests"
  add_foreign_key "profile_preferred_interests", "profiles"
  add_foreign_key "profile_preferred_mbtis", "preferred_mbtis"
  add_foreign_key "profile_preferred_mbtis", "profiles"
  add_foreign_key "profile_preferred_relationships", "preferred_relationships"
  add_foreign_key "profile_preferred_relationships", "profiles"
  add_foreign_key "profile_relationships", "profiles"
  add_foreign_key "profile_relationships", "relationships"
  add_foreign_key "profiles", "degrees"
  add_foreign_key "profiles", "genders"
  add_foreign_key "profiles", "mbtis"
  add_foreign_key "profiles", "programs"
  add_foreign_key "profiles", "schools"
  add_foreign_key "profiles", "users"
  add_foreign_key "users_preferred_degrees", "preferences"
  add_foreign_key "users_preferred_degrees", "preferred_degrees"
  add_foreign_key "users_preferred_genders", "preferences"
  add_foreign_key "users_preferred_genders", "preferred_genders"
  add_foreign_key "users_preferred_interests", "preferences"
  add_foreign_key "users_preferred_interests", "preferred_interests"
  add_foreign_key "users_preferred_mbtis", "preferences"
  add_foreign_key "users_preferred_mbtis", "preferred_mbtis"
  add_foreign_key "users_preferred_programs", "preferences"
  add_foreign_key "users_preferred_programs", "preferred_programs"
  add_foreign_key "users_preferred_relationships", "preferences"
  add_foreign_key "users_preferred_relationships", "preferred_relationships"
  add_foreign_key "users_preferred_schools", "preferences"
  add_foreign_key "users_preferred_schools", "preferred_schools"
end
