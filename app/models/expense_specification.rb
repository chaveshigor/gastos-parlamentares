# frozen_string_literal: true

class ExpenseSpecification < ApplicationRecord
  belongs_to :expense_type

  validates_presence_of :description
  validates_uniqueness_of :code
end
