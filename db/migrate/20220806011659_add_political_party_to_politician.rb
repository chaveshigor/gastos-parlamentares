class AddPoliticalPartyToPolitician < ActiveRecord::Migration[6.0]
  def change
    add_reference :politicians, :political_party, null: false, foreign_key: true
  end
end
