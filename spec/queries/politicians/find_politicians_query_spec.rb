# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Politicians::FindPoliticiansQuery do
  let(:run_service) { described_class.new(params, ransack_query).run }

  describe '#run' do
    context 'when name search is not used' do
      let!(:politicians) { create_list(:politician, 3, :with_expenses) }
      let(:ransack_query) { Politician.ransack }
      let(:params) { { query: {} } }

      it 'return all politicians' do
        expect(run_service).to match_array(politicians)
      end
    end

    context 'when name search is used' do
      let!(:politicians) { create_list(:politician, 3, :with_expenses) }
      let(:params) { { query: { name_cont: politicians.last.name } } }
      let(:ransack_query) { Politician.ransack(params[:query]) }

      it 'return politicians matches' do
        expect(run_service).to eq([politicians.last])
      end
    end

    context 'when order is by name' do
      let!(:politicians) { create_list(:politician, 3, :with_expenses) }
      let(:params) { { query: {}, order_by: 'name' } }
      let(:ransack_query) { Politician.ransack }

      it 'return politicians ordered by name' do
        expect(run_service).to eq(Politician.all.order_by_name)
      end
    end

    context 'when order is by expenses' do
      let!(:politicians) { create_list(:politician, 3, :with_expenses) }
      let(:params) { { query: {}, order_by: 'expenses' } }
      let(:ransack_query) { Politician.ransack }

      it 'return politicians ordered by expenses' do
        expect(run_service).to eq(Politician.all.order_by_expenses)
      end
    end
  end
end
