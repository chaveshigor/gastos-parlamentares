# frozen_string_literal: true

module PoliticiansHelper
  include ActionView::Helpers::NumberHelper

  def format_currency(amount)
    number_to_currency(amount, unit: 'R$', separator: '.')
  end
end
