# frozen_string_literal: true

class CreatePoliticalParties < ActiveRecord::Migration[6.0]
  def change
    create_table :political_parties do |t|
      t.string :name

      t.timestamps
    end
  end
end
