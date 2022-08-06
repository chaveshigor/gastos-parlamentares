# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Politician, type: :model do
  let!(:politician) { create(:politician, :with_legislature, :with_political_party) }

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
end
