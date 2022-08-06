# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'associations' do
    it { should belong_to(:expense_type) }
    it { should belong_to(:provider) }
    it { should belong_to(:politician) }
  end

  describe 'validations' do
    it { should validate_presence_of(:document_number) }
    it { should validate_presence_of(:document_type) }
    it { should validate_presence_of(:generation_date) }
    it { should validate_presence_of(:document_value) }
    it { should validate_presence_of(:gloss_value) }
    it { should validate_presence_of(:net_value) }
    it { should validate_presence_of(:month) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:installment_number) }
    it { should validate_presence_of(:lot_number) }
    it { should define_enum_for(:document_type) }
  end
end
