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

ActiveRecord::Schema[7.0].define(version: 2024_04_08_080743) do
  create_table "items", charset: "utf8", force: :cascade do |t|
    t.string "item_name", null: false
    t.integer "size_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_inventory"
  end

  create_table "stores", charset: "utf8", force: :cascade do |t|
    t.string "store_name", null: false
    t.text "description", null: false
    t.text "address", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "opening_hours", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
