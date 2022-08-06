# frozen_string_literal: true

class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :cnpj_cpf

      t.timestamps
    end
  end
end
