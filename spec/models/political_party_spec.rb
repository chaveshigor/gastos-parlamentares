# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PoliticalParty, type: :model do
  describe 'associations' do
    it { should have_many(:politicians) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
