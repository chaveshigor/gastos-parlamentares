# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_805_235_114) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'legislatures', force: :cascade do |t|
    t.string 'year'
    t.string 'code'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'politicians', force: :cascade do |t|
    t.string 'name'
    t.string 'cpf'
    t.string 'registration_id'
    t.string 'wallet'
    t.string 'uf'
    t.bigint 'legislature_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['legislature_id'], name: 'index_politicians_on_legislature_id'
  end
end
