# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpenseSpecification, type: :model do
  describe 'associations' do
    it { should belong_to(:expense_type).optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:code) }
  end
end
