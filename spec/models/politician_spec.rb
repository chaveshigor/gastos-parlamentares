# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Politician, type: :model do
  describe 'associations' do
    it { should belong_to(:legislature) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:uf) }
    it { should validate_uniqueness_of(:cpf).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:registration_id).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:wallet).ignoring_case_sensitivity }
  end
end
