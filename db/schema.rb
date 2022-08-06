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

ActiveRecord::Schema.define(version: 2022_08_06_024918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expense_specifications", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.bigint "expense_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_type_id"], name: "index_expense_specifications_on_expense_type_id"
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "document_number"
    t.integer "document_type"
    t.date "generation_date"
    t.decimal "document_value"
    t.string "document_url"
    t.decimal "gloss_value"
    t.decimal "net_value"
    t.integer "month"
    t.integer "year"
    t.integer "installment_number"
    t.string "passanger_name"
    t.string "travel_stretch"
    t.string "lot_number"
    t.string "reimbursement_number"
    t.decimal "reimbursement_amount"
    t.bigint "politician_id"
    t.bigint "expense_type_id"
    t.bigint "provider_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_type_id"], name: "index_expenses_on_expense_type_id"
    t.index ["politician_id"], name: "index_expenses_on_politician_id"
    t.index ["provider_id"], name: "index_expenses_on_provider_id"
  end

  create_table "legislatures", force: :cascade do |t|
    t.string "year"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "political_parties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "politicians", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "registration_id"
    t.string "wallet"
    t.string "uf"
    t.bigint "legislature_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "political_party_id", null: false
    t.index ["legislature_id"], name: "index_politicians_on_legislature_id"
    t.index ["political_party_id"], name: "index_politicians_on_political_party_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "cnpj_cpf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "politicians", "political_parties"
end
