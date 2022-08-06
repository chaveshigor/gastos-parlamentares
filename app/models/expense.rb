# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :expense_type
  belongs_to :provider
  belongs_to :politician

  enum document_type: {
    'Nota Fiscal': 0,
    'Recibo': 1,
    'Despesa no Exterior': 2
  }

  validates_presence_of :document_number, :document_type, :generation_date, :document_value,
                        :gloss_value, :net_value, :month, :year, :installment_number, :lot_number
end
