# frozen_string_literal: true

class Politician < ApplicationRecord
  belongs_to :legislature
  belongs_to :political_party
  has_many :expenses

  validates_presence_of :name, :uf
  validates_uniqueness_of :cpf, :registration_id, :wallet

  def picture
    "https://www.camara.leg.br/internet/deputado/bandep/#{registration_id}.jpg"
  end

  def total_expenses
    expenses.pluck(:net_value).sum
  end
end
