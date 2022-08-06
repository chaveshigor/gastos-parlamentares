# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CsvUploads::CsvHandlerService do
  let(:run_service) { described_class.new(file: csv_file).run }

  describe '#run' do
    before do
      @runner = double('runner')
      allow(CsvUploads::StoreDataService).to receive(:new).and_return(@runner)
      allow(@runner).to receive(:run).and_return(true)
    end

    context 'when file is valid' do
      let(:csv_file) { fixture_file_upload('files/valid.csv', 'text/csv') }

      it 'return true' do
        expect(run_service).to be(true)
      end

      it 'call #run only when UF is RJ' do
        expect(@runner).to receive(:run).exactly(9).times
        run_service
      end
    end

    context 'when file is invalid' do
      let(:csv_file) { fixture_file_upload('files/invalid.json', 'json') }

      it 'return true' do
        expect(run_service).to be(false)
      end
    end
  end
end
