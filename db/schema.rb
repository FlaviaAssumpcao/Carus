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

ActiveRecord::Schema[7.0].define(version: 2022_09_05_131434) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "donations", force: :cascade do |t|
    t.datetime "date"
    t.bigint "user_id", null: false
    t.bigint "nonprofit_id", null: false
    t.bigint "goods_category_id"
    t.bigint "time_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goods_category_id"], name: "index_donations_on_goods_category_id"
    t.index ["nonprofit_id"], name: "index_donations_on_nonprofit_id"
    t.index ["time_category_id"], name: "index_donations_on_time_category_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "nonprofit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nonprofit_id"], name: "index_favorites_on_nonprofit_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "goods_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods_categorizations", force: :cascade do |t|
    t.bigint "nonprofit_id", null: false
    t.bigint "goods_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goods_category_id"], name: "index_goods_categorizations_on_goods_category_id"
    t.index ["nonprofit_id"], name: "index_goods_categorizations_on_nonprofit_id"
  end

  create_table "nonprofits", force: :cascade do |t|
    t.string "name"
    t.text "brief_description"
    t.text "address"
    t.string "phone"
    t.string "city"
    t.text "full_description"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_time", default: 9
    t.integer "max_time", default: 18
    t.float "latitude"
    t.float "longitude"
  end

  create_table "time_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_categorizations", force: :cascade do |t|
    t.bigint "nonprofit_id", null: false
    t.bigint "time_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nonprofit_id"], name: "index_time_categorizations_on_nonprofit_id"
    t.index ["time_category_id"], name: "index_time_categorizations_on_time_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "donations", "goods_categories"
  add_foreign_key "donations", "nonprofits"
  add_foreign_key "donations", "time_categories"
  add_foreign_key "donations", "users"
  add_foreign_key "favorites", "nonprofits"
  add_foreign_key "favorites", "users"
  add_foreign_key "goods_categorizations", "goods_categories"
  add_foreign_key "goods_categorizations", "nonprofits"
  add_foreign_key "time_categorizations", "nonprofits"
  add_foreign_key "time_categorizations", "time_categories"
end
