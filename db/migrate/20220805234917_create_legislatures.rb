# frozen_string_literal: true

class CreateLegislatures < ActiveRecord::Migration[6.0]
  def change
    create_table :legislatures do |t|
      t.string :year
      t.string :code

      t.timestamps
    end
  end
end
