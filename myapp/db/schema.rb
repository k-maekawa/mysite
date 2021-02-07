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

ActiveRecord::Schema.define(version: 2021_02_05_114953) do

  create_table "properties", force: :cascade do |t|
    t.string "house_name"
    t.string "area_name"
    t.string "house_adress"
    t.string "house_station"
    t.string "house_skill"
    t.integer "house_distance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rent"
    t.string "property_img"
    t.float "latitude"
    t.float "longitude"
    t.index ["house_adress"], name: "index_properties_on_house_adress", unique: true
    t.index ["house_name"], name: "index_properties_on_house_name", unique: true
  end

  create_table "rooms", force: :cascade do |t|
    t.string "vacant_room"
    t.integer "room_number"
    t.float "space"
    t.string "room_type"
    t.string "room_img"
    t.integer "property_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id", "created_at"], name: "index_rooms_on_property_id_and_created_at"
    t.index ["property_id"], name: "index_rooms_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "user_img"
  end

  add_foreign_key "rooms", "properties"
end
