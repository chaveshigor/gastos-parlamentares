# frozen_string_literal: true

class CreateExpenseTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :expense_types do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
