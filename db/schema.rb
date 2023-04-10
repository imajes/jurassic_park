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

ActiveRecord::Schema[7.0].define(version: 2023_04_06_195656) do
  create_table "dinosaurs", force: :cascade do |t|
    t.string "name"
    t.integer "paddock_id"
    t.integer "type"
    t.integer "species"
    t.integer "gender"
    t.datetime "born_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paddock_id"], name: "index_dinosaurs_on_paddock_id"
  end

  create_table "paddocks", force: :cascade do |t|
    t.string "name"
    t.integer "park_id"
    t.integer "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_paddocks_on_park_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "host_country"
    t.string "corporate_entity"
    t.boolean "online", default: false
    t.datetime "launched_at", precision: nil
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
