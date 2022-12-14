# frozen_string_literal: true

class ExpenseType < ApplicationRecord
  has_one :expense_specification

  validates_presence_of :description
  validates_uniqueness_of :code
end
