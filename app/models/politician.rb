# frozen_string_literal: true

class Politician < ApplicationRecord
  belongs_to :legislature
  belongs_to :political_party
  has_many :expenses

  validates_presence_of :name, :uf
  validates_uniqueness_of :cpf, :registration_id, :wallet

  scope :order_by_expenses, -> { joins(:expenses).group('politicians.id').order('SUM(expenses.net_value) desc') }
  scope :order_by_name, -> { order(name: :asc) }

  def picture
    "https://www.camara.leg.br/internet/deputado/bandep/#{registration_id}.jpg"
  end

  def total_expenses
    expenses.pluck(:net_value).sum
  end

  def biggest_expense
    expenses.includes(:provider).max_by(&:net_value)
  end
end
