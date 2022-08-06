# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CsvUploadsController', type: :request do
  describe 'POST #uploader' do
    let(:upload_request) { post uploader_csv_uploads_path }

    context 'when file is valid' do
      before do
        runner = double('runner')
        allow(CsvUploads::CsvHandlerService).to receive(:new).and_return(runner)
        allow(runner).to receive(:run).and_return(true)
      end

      it 'render success message' do
        upload_request

        expect(flash[:notice]).to eq(I18n.t('csv_uploads.upload_success_message'))
      end
    end

    context 'when file is invalid' do
      before do
        runner = double('runner')
        allow(CsvUploads::CsvHandlerService).to receive(:new).and_return(runner)
        allow(runner).to receive(:run).and_return(false)
      end

      it 'render success message' do
        upload_request

        expect(flash[:alert]).to eq(I18n.t('csv_uploads.upload_error_message'))
      end
    end
  end
end
