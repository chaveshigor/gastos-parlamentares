# frozen_string_literal: true

module Politicians
  class DeleteAllService < ApplicationService
    def initialize; end

    def run
      delete_all
    end

    private

    def delete_all
      ActiveRecord::Base.transaction do
        Expense.destroy_all
        ExpenseSpecification.destroy_all
        ExpenseType.destroy_all
        Provider.destroy_all
        Politician.destroy_all
        PoliticalParty.destroy_all
        Legislature.destroy_all

        return true
      end
    rescue StandardError => e
      puts e
      false
    end
  end
end
