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

ActiveRecord::Schema[7.0].define(version: 2022_10_14_132343) do
  create_table "beds", force: :cascade do |t|
    t.integer "bed_size"
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_beds_on_room_id"
  end

  create_table "listings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "short_description"
    t.string "long_description"
    t.integer "status", default: 0
    t.integer "guests", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "lat"
    t.string "lng"
    t.string "address_line1"
    t.string "address_line2"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "room_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_rooms_on_listing_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "beds", "rooms"
  add_foreign_key "listings", "users"
  add_foreign_key "rooms", "listings"
end
