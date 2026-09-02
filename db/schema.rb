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

ActiveRecord::Schema[8.0].define(version: 2026_09_02_104740) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_areas_on_slug", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.string "whatsapp"
    t.boolean "featured"
    t.string "website"
    t.string "instagram"
    t.string "facebook"
    t.string "google_maps"
    t.string "phone"
    t.text "search_keywords"
    t.bigint "area_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_businesses_on_area_id"
    t.index ["category_id"], name: "index_businesses_on_category_id"
    t.index ["slug"], name: "index_businesses_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  add_foreign_key "businesses", "areas"
  add_foreign_key "businesses", "categories"
end
