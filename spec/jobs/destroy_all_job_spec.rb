# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DestroyAllJob do
  let(:run_service) { described_class.perform_now }

  before do
    @runner = double('runner')
    allow(Politicians::DeleteAllService).to receive(:new).and_return(@runner)
    allow(@runner).to receive(:run).and_return(true)
  end

  describe '#run' do
    it 'call Politicians::DeleteAllService.new.run' do
      expect(@runner).to receive(:run)
      run_service
    end
  end
end
