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

ActiveRecord::Schema[7.0].define(version: 2022_09_21_070008) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.string "about"
    t.string "htuse"
    t.string "terms"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.string "news"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bgvars", primary_key: "visits", id: :bigint, default: -> { "nextval('bgvars_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "regid"
  end

  create_table "changes", force: :cascade do |t|
    t.string "time"
    t.string "email"
    t.string "table"
    t.string "cord"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "cname"
    t.string "more"
    t.string "regon"
    t.string "yt"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_1_gsdg_p", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "pid"
    t.string "q1", limit: 100
    t.string "q2", limit: 100
    t.string "q3", limit: 100
    t.string "q4", limit: 100
  end

  create_table "exam_1_gsdg_q", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "question", limit: 250
    t.string "opt1", limit: 100
    t.string "opt2", limit: 100
    t.string "opt3", limit: 100
    t.string "opt4", limit: 100
    t.string "correct", limit: 100
  end

  create_table "exam_2_gsdg_p", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "pid"
  end

  create_table "exam_2_gsdg_q", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "question", limit: 250
    t.string "opt1", limit: 100
    t.string "opt2", limit: 100
    t.string "opt3", limit: 100
    t.string "opt4", limit: 100
    t.string "correct", limit: 100
  end

  create_table "exam_3_gsdg_p", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "pid"
  end

  create_table "exam_3_gsdg_q", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "question", limit: 250
    t.string "opt1", limit: 100
    t.string "opt2", limit: 100
    t.string "opt3", limit: 100
    t.string "opt4", limit: 100
    t.string "correct", limit: 100
  end

  create_table "exam_4_gsdg_p", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "pid"
  end

  create_table "exam_4_gsdg_q", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "question", limit: 250
    t.string "opt1", limit: 100
    t.string "opt2", limit: 100
    t.string "opt3", limit: 100
    t.string "opt4", limit: 100
    t.string "correct", limit: 100
  end

  create_table "exam_5_gsdg_p", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "pid"
  end

  create_table "exam_5_gsdg_q", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "question", limit: 250
    t.string "opt1", limit: 100
    t.string "opt2", limit: 100
    t.string "opt3", limit: 100
    t.string "opt4", limit: 100
    t.string "correct", limit: 100
  end

  create_table "exam_8_gsdg_p", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "pid"
  end

  create_table "exam_8_gsdg_q", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "question", limit: 250
    t.string "opt1", limit: 100
    t.string "opt2", limit: 100
    t.string "opt3", limit: 100
    t.string "opt4", limit: 100
    t.string "correct", limit: 100
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.string "info"
    t.boolean "etype", default: true, null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "email"
    t.string "typef"
    t.string "feedback"
    t.string "time"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gsdg", id: :serial, force: :cascade do |t|
    t.integer "pid"
    t.string "regid", limit: 10
    t.string "email", limit: 50
    t.integer "exam_1_gsdg"
    t.integer "exam_2_gsdg"
    t.integer "exam_3_gsdg"
    t.integer "exam_4_gsdg"
    t.integer "exam_5_gsdg"
    t.integer "exam_8_gsdg"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shloks", force: :cascade do |t|
    t.string "title"
    t.string "shlok"
    t.string "translation"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.boolean "profile"
    t.string "country"
    t.string "state"
    t.string "pin"
    t.string "gender"
    t.string "age"
    t.string "mobile"
    t.string "sanslevel"
    t.string "acadqual"
    t.string "regid"
    t.string "courses"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "gsdg", "users", column: "pid", name: "fk_user_id"
end
