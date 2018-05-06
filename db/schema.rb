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

ActiveRecord::Schema.define(version: 20180503005100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "btree_gin"

  create_table "farmie_pictures", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "farmie_id"
    t.string "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "farmies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_farmies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_farmies_on_reset_password_token", unique: true
  end

  create_table "profiles", force: :cascade do |t|
    t.text "intro"
    t.text "about"
    t.integer "farmie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show_visited_farms", default: false
    t.string "picture"
    t.string "anonymous_picture", default: "farmer-penguin.jpg"
    t.text "farm_pictures", default: [], array: true
    t.index ["farm_pictures"], name: "index_profiles_on_farm_pictures", using: :gin
  end

end
