# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Politicians::DeleteAllService do
  let(:run_service) { described_class.new.run }
  let!(:polititians) { create_list(:politician, 10) }

  describe '#run' do
    it 'delete all entities' do
      run_service

      expect(Politician.all.count).to eq(0)
      expect(Expense.all.count).to eq(0)
      expect(ExpenseType.all.count).to eq(0)
      expect(ExpenseSpecification.all.count).to eq(0)
      expect(Provider.all.count).to eq(0)
      expect(PoliticalParty.all.count).to eq(0)
      expect(Legislature.all.count).to eq(0)
    end
  end
end
