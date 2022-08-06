# frozen_string_literal: true

module CsvUploads
  class StoreDataService < ApplicationService
    def run(current_csv_data)
      @current_csv_data = current_csv_data
      create_entities
    end

    private

    attr_reader :current_csv_data

    def create_entities
      ActiveRecord::Base.transaction do
        create_legislature
        create_political_party
        create_politician
        create_providers
        create_expense_type
        create_expense_specification
        create_expense
      rescue StandardError => e
        puts e
      end
    end

    def create_legislature
      @legislature = Legislature.find_or_create_by!(current_csv_data[:legislature])
    end

    def create_political_party
      @political_party = PoliticalParty.find_or_create_by!(current_csv_data[:political_party])
    end

    def create_politician
      @politician = Politician.find_or_create_by!(
        current_csv_data[:politician]
        .merge({ legislature_id: @legislature.id, political_party_id: @political_party.id })
      )
    end

    def create_providers
      @provider = Provider.find_or_create_by!(current_csv_data[:provider])
    end

    def create_expense_type
      @expense_type = ExpenseType.find_or_create_by!(current_csv_data[:expense_type])
    end

    def create_expense_specification
      @expense_specification = ExpenseSpecification.find_or_create_by!(
        current_csv_data[:expense_type]
        .merge({ expense_type_id: @expense_type.id })
      )
    end

    def create_expense
      @expense = Expense.find_or_create_by!(
        current_csv_data[:expense]
        .merge({ politician_id: @politician.id, expense_type_id: @expense_type.id, provider_id: @provider.id })
      )
    end
  end
end
