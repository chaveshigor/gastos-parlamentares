# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PoliticiansHelper, type: :helper do
  describe '#format_currency' do
    it 'format to brasilian currency' do
      amount = 12_365.99
      expect(format_currency(amount)).to eq('R$12,365.99')
    end
  end
end
