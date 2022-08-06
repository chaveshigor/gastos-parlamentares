# frozen_string_literal: true

class ExpenseSpecification < ApplicationRecord
  belongs_to :expense_type, optional: true

  validates_presence_of :description
  validates_uniqueness_of :code
end
