# frozen_string_literal: true

class CreateExpenseSpecifications < ActiveRecord::Migration[6.0]
  def change
    create_table :expense_specifications do |t|
      t.string :code
      t.string :description
      t.references :expense_type

      t.timestamps
    end
  end
end
