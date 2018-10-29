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

ActiveRecord::Schema.define(version: 20181016130056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_patients", force: :cascade do |t|
    t.bigint "patient_id"
    t.date "enrollment_date"
    t.string "unique_art_number"
    t.string "target_population_category"
    t.jsonb "mother_full_name"
    t.string "place_of_delivery"
    t.string "mode_of_delivery"
    t.string "care_giver_marital_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_art_patients_on_patient_id"
  end

  create_table "care_givers", force: :cascade do |t|
    t.bigint "art_patient_id"
    t.string "full_name"
    t.integer "age"
    t.string "gender"
    t.string "relation"
    t.boolean "address_same_as_patient"
    t.bigint "organization_structure_id"
    t.string "kebele"
    t.string "house_number"
    t.jsonb "telephones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_patient_id"], name: "index_care_givers_on_art_patient_id"
    t.index ["organization_structure_id"], name: "index_care_givers_on_organization_structure_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dependents", force: :cascade do |t|
    t.bigint "art_patient_id"
    t.string "name"
    t.string "relation"
    t.integer "age"
    t.string "health_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_patient_id"], name: "index_dependents_on_art_patient_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.bigint "organization_structure_id"
    t.string "name"
    t.bigint "facility_type_id"
    t.string "category"
    t.string "url"
    t.integer "latitude"
    t.integer "longitude"
    t.integer "population"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_type_id"], name: "index_facilities_on_facility_type_id"
    t.index ["organization_structure_id"], name: "index_facilities_on_organization_structure_id"
  end

  create_table "facility_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_structure_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_structures", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "organization_structure_type_id"
    t.integer "parent_organization_structure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_structure_type_id"], name: "index_organization_structures_on_organization_structure_type_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "mrn"
    t.string "first_name"
    t.string "father_name"
    t.string "grand_father_name"
    t.string "gender"
    t.date "date_of_birth"
    t.jsonb "age"
    t.string "mother_first_name"
    t.string "religion"
    t.string "education_level"
    t.string "occupation"
    t.string "marital_status"
    t.bigint "organization_structure_id"
    t.string "residence_type"
    t.string "kebele"
    t.string "house_number"
    t.jsonb "telephones"
    t.boolean "catchment_area"
    t.boolean "followup_challenge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_structure_id"], name: "index_patients_on_organization_structure_id"
  end

  create_table "referrals", force: :cascade do |t|
    t.bigint "art_patient_id"
    t.string "referred_from"
    t.bigint "department_id"
    t.string "outside_referral_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_patient_id"], name: "index_referrals_on_art_patient_id"
    t.index ["department_id"], name: "index_referrals_on_department_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relatives", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "name"
    t.string "relationship"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_relatives_on_patient_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "father_name"
    t.string "grand_father_name"
    t.bigint "organization_structure_id"
    t.bigint "facility_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["facility_id"], name: "index_users_on_facility_id"
    t.index ["organization_structure_id"], name: "index_users_on_organization_structure_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "art_patients", "patients"
  add_foreign_key "care_givers", "art_patients"
  add_foreign_key "care_givers", "organization_structures"
  add_foreign_key "dependents", "art_patients"
  add_foreign_key "facilities", "facility_types"
  add_foreign_key "facilities", "organization_structures"
  add_foreign_key "organization_structures", "organization_structure_types"
  add_foreign_key "patients", "organization_structures"
  add_foreign_key "referrals", "art_patients"
  add_foreign_key "referrals", "departments"
  add_foreign_key "relatives", "patients"
  add_foreign_key "users", "facilities"
  add_foreign_key "users", "organization_structures"
end
