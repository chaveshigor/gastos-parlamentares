# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :document_number
      t.integer :document_type
      t.date :generation_date
      t.decimal :document_value
      t.string :document_url
      t.decimal :gloss_value
      t.decimal :net_value
      t.integer :month
      t.integer :year
      t.integer :installment_number
      t.string :passanger_name
      t.string :travel_stretch
      t.string :lot_number
      t.string :reimbursement_number
      t.decimal :reimbursement_amount
      t.references :politician
      t.references :expense_type
      t.references :provider

      t.timestamps
    end
  end
end
