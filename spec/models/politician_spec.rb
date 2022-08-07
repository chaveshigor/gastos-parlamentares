# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Politician, type: :model do
  let!(:politician) { create(:politician, :with_expenses) }

  describe 'associations' do
    it { should belong_to(:legislature) }
    it { should belong_to(:political_party) }
    it { should have_many(:expenses) }
  end

  describe 'validations' do
    subject { politician }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:uf) }
    it { should validate_uniqueness_of(:cpf).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:registration_id).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:wallet).ignoring_case_sensitivity }
  end

  describe '#picture' do
    it 'return politician picture url' do
      expect(politician.picture).to eq("https://www.camara.leg.br/internet/deputado/bandep/#{politician.registration_id}.jpg")
    end
  end

  describe '#total_expenses' do
    it 'return politician total_expenses' do
      expect(politician.total_expenses).to eq(politician.expenses.pluck(:net_value).sum)
    end
  end

  describe '#biggest_expense' do
    it 'return politician biggest expense' do
      expect(politician.biggest_expense.net_value).to eq(politician.expenses.pluck(:net_value).max)
    end
  end
end
