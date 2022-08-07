# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Politicians', type: :request do
  let!(:politicians) { create_list(:politician, 3, :with_expenses) }

  describe 'GET #index' do
    context 'when name search is not used' do
      it 'return all politicians' do
        get politicians_path

        expect(assigns(:politicians)).to match_array(politicians)
      end
    end

    context 'when name search is used' do
      it 'return politicians matches' do
        get politicians_path, params: { query: { name_cont: politicians.last.name } }

        expect(assigns(:politicians)).to eq([politicians.last])
      end
    end
  end

  describe 'GET #show' do
    it 'return politician' do
      get politician_path(politicians.first)

      expect(assigns(:politician)).to eq(politicians.first)
      expect(assigns(:expenses)).to match_array(politicians.first.expenses)
    end
  end
end
