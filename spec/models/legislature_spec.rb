require 'rails_helper'

RSpec.describe Legislature, type: :model do
  describe 'associations' do
    #it { should belong_to(:category).class_name('MenuCategory') }
    it { should have_many(:politicians) }
  end

  describe 'validations' do
    it { should validate_presence_of(:year) }
    it { should validate_uniqueness_of(:code) }
  end
end
