# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_17_203459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "budget_month_items", force: :cascade do |t|
    t.uuid "uid", null: false
    t.uuid "budget_month_id", null: false
    t.uuid "budget_month_items_group_id", null: false
    t.decimal "budgeted", precision: 2, default: "0"
    t.decimal "spent", precision: 2, default: "0"
    t.decimal "avaiable", precision: 2, default: "0"
    t.string "name", limit: 140, null: false
    t.uuid "schema_id", null: false
    t.uuid "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["budget_month_id"], name: "index_budget_month_items_on_budget_month_id"
    t.index ["budget_month_items_group_id"], name: "index_budget_month_items_on_budget_month_items_group_id"
    t.index ["category_id"], name: "index_budget_month_items_on_category_id"
    t.index ["schema_id"], name: "index_budget_month_items_on_schema_id"
  end

  create_table "budget_month_items_groups", force: :cascade do |t|
    t.uuid "uid", null: false
    t.uuid "budget_month_id", null: false
    t.decimal "budgeted", precision: 2, default: "0"
    t.decimal "spent", precision: 2, default: "0"
    t.decimal "avaiable", precision: 2, default: "0"
    t.string "name", limit: 140, null: false
    t.uuid "schema_id", null: false
    t.uuid "categories_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["budget_month_id"], name: "index_budget_month_items_groups_on_budget_month_id"
    t.index ["categories_group_id"], name: "index_budget_month_items_groups_on_categories_group_id"
    t.index ["schema_id"], name: "index_budget_month_items_groups_on_schema_id"
  end

  create_table "budget_months", force: :cascade do |t|
    t.uuid "uid", null: false
    t.uuid "schema_id", null: false
    t.integer "month", null: false
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.uuid "uid", null: false
    t.string "name", limit: 140, null: false
    t.boolean "budgeted", default: false
    t.uuid "schema_id", null: false
    t.uuid "categories_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categories_group_id"], name: "index_categories_on_categories_group_id"
  end

  create_table "categories_groups", force: :cascade do |t|
    t.uuid "uid", null: false
    t.string "name", limit: 140, null: false
    t.boolean "budgeted", default: false
    t.uuid "schema_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schema_id"], name: "index_categories_groups_on_schema_id"
  end

  create_table "event_store_events", id: :serial, force: :cascade do |t|
    t.uuid "event_id", null: false
    t.string "event_type", null: false
    t.binary "metadata"
    t.binary "data", null: false
    t.datetime "created_at", null: false
    t.datetime "valid_at"
    t.index ["created_at"], name: "index_event_store_events_on_created_at"
    t.index ["event_id"], name: "index_event_store_events_on_event_id", unique: true
    t.index ["event_type"], name: "index_event_store_events_on_event_type"
    t.index ["valid_at"], name: "index_event_store_events_on_valid_at"
  end

  create_table "event_store_events_in_streams", id: :serial, force: :cascade do |t|
    t.string "stream", null: false
    t.integer "position"
    t.uuid "event_id", null: false
    t.datetime "created_at", null: false
    t.index ["created_at"], name: "index_event_store_events_in_streams_on_created_at"
    t.index ["stream", "event_id"], name: "index_event_store_events_in_streams_on_stream_and_event_id", unique: true
    t.index ["stream", "position"], name: "index_event_store_events_in_streams_on_stream_and_position", unique: true
  end

  create_table "schemas", force: :cascade do |t|
    t.uuid "uid", null: false
  end

end
