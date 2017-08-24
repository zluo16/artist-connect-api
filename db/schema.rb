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

ActiveRecord::Schema.define(version: 20170822030440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_posting_id"
    t.text "resume"
    t.text "cover_letter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_posting_id"], name: "index_applications_on_job_posting_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "school_name"
    t.string "education_level"
    t.string "year_started"
    t.string "year_completed"
    t.string "gpa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id"
    t.string "company_name"
    t.string "title"
    t.string "start_year"
    t.string "end_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "job_postings", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "title"
    t.text "description"
    t.text "responsibilities"
    t.text "qualifications"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_job_postings_on_organization_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "locatable_type"
    t.bigint "locatable_id"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "suite"
    t.string "zipcode"
    t.boolean "main", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
  end

  create_table "organization_connections", force: :cascade do |t|
    t.bigint "org_connector_id"
    t.bigint "connected_org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connected_org_id"], name: "index_organization_connections_on_connected_org_id"
    t.index ["org_connector_id"], name: "index_organization_connections_on_org_connector_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "organization_type"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ownerships", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "owned_org_id"
    t.string "relation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owned_org_id"], name: "index_ownerships_on_owned_org_id"
    t.index ["owner_id"], name: "index_ownerships_on_owner_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "text"
    t.integer "likes"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "skill"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_tags_on_organization_id"
  end

  create_table "user_connections", force: :cascade do |t|
    t.bigint "connector_id"
    t.bigint "connectee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connectee_id"], name: "index_user_connections_on_connectee_id"
    t.index ["connector_id"], name: "index_user_connections_on_connector_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "stage_name"
    t.string "email"
    t.datetime "dob"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "about"
    t.string "gender"
    t.string "image_link"
  end

  add_foreign_key "applications", "job_postings"
  add_foreign_key "applications", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "posts", "users"
end
