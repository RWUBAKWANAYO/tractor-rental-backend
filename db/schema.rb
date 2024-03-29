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

ActiveRecord::Schema[7.0].define(version: 2022_11_10_081607) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rents", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tractor_id", null: false
    t.integer "estimated_time"
    t.integer "total_costs"
    t.boolean "new_farm"
    t.string "farm_size"
    t.date "rent_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tractor_id"], name: "index_rents_on_tractor_id"
    t.index ["user_id"], name: "index_rents_on_user_id"
  end

  create_table "tractors", force: :cascade do |t|
    t.string "photo"
    t.string "name"
    t.string "description"
    t.integer "price"
    t.integer "new_farm_price"
    t.integer "completion"
    t.integer "demand", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "role", default: 866933
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "rents", "tractors"
  add_foreign_key "rents", "users"
end
