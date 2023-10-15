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

ActiveRecord::Schema[7.1].define(version: 2023_10_16_091645) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
    t.index ["name"], name: "index_currencies_on_name", unique: true
  end

  create_table "currency_rate_fetches", force: :cascade do |t|
    t.bigint "currency_rate_source_id", null: false
    t.boolean "actual", default: false, null: false
    t.datetime "datetime_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_rate_source_id"], name: "index_currency_rate_fetches_on_currency_rate_source_id"
  end

  create_table "currency_rate_sources", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "base_currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_currency_id"], name: "index_currency_rate_sources_on_base_currency_id"
    t.index ["name"], name: "index_currency_rate_sources_on_name", unique: true
    t.index ["url"], name: "index_currency_rate_sources_on_url", unique: true
  end

  create_table "currency_rates", force: :cascade do |t|
    t.decimal "value"
    t.decimal "manual_value"
    t.integer "nominal"
    t.bigint "currency_id", null: false
    t.bigint "currency_rate_fetch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_currency_rates_on_currency_id"
    t.index ["currency_rate_fetch_id"], name: "index_currency_rates_on_currency_rate_fetch_id"
  end

  add_foreign_key "currency_rate_fetches", "currency_rate_sources"
  add_foreign_key "currency_rate_sources", "currencies", column: "base_currency_id"
  add_foreign_key "currency_rates", "currencies"
  add_foreign_key "currency_rates", "currency_rate_fetches"
end
