# frozen_string_literal: true

class CreatePoliticians < ActiveRecord::Migration[6.0]
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :cpf
      t.string :registration_id
      t.string :wallet
      t.string :uf
      t.references :legislature

      t.timestamps
    end
  end
end
