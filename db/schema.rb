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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_112020) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.time "min_time"
    t.time "max_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "goods_categorizations", "goods_categories"
  add_foreign_key "goods_categorizations", "nonprofits"
  add_foreign_key "time_categorizations", "nonprofits"
  add_foreign_key "time_categorizations", "time_categories"
end
