# frozen_string_literal: true

class ExpenseType < ApplicationRecord
  validates_presence_of :description
  validates_uniqueness_of :code
end
