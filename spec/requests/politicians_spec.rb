# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Politicians', type: :request do
  describe 'GET #index' do
    context 'when name search is not used' do
      let!(:politicians) { create_list(:politician, 3, :with_expenses) }

      it 'return all politicians' do
        get politicians_path

        expect(assigns(:politicians)).to match_array(politicians)
      end
    end

    context 'when name search is used' do
      let!(:politicians) { create_list(:politician, 3, :with_expenses) }

      it 'return politicians matches' do
        get politicians_path, params: { query: { name_cont: politicians.last.name } }

        expect(assigns(:politicians)).to eq([politicians.last])
      end
    end

    context 'when there is no politicians' do
      it 'return flash message to request file upload' do
        get politicians_path

        expect(flash[:notice]).to eq(I18n.t('csv_uploads.upload_needed'))
      end
    end
  end

  describe 'GET #show' do
    let!(:politicians) { create_list(:politician, 3, :with_expenses) }

    it 'return politician' do
      get politician_path(politicians.first)

      expect(assigns(:politician)).to eq(politicians.first)
      expect(assigns(:expenses)).to match_array(politicians.first.expenses)
    end
  end

  describe 'DELETE #delete_all' do
    let!(:politicians) { create_list(:politician, 3, :with_expenses) }

    context 'when delete_all method return true' do
      before do
        runner = double('runner')
        allow(Politicians::DeleteAllService).to receive(:new).and_return(runner)
        allow(runner).to receive(:run).and_return(true)
      end

      it 'call delete_all service' do
        delete destroy_all_politicians_path

        expect(flash[:notice]).to eq(I18n.t('csv_uploads.destroy_success_message'))
      end
    end

    context 'when delete_all method return false' do
      before do
        runner = double('runner')
        allow(Politicians::DeleteAllService).to receive(:new).and_return(runner)
        allow(runner).to receive(:run).and_return(false)
      end

      it 'call delete_all service' do
        delete destroy_all_politicians_path

        expect(flash[:alert]).to eq(I18n.t('csv_uploads.destroy_error_message'))
      end
    end
  end
end
