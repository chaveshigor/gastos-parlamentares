# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Provider, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:cnpj_cpf).ignoring_case_sensitivity }
end
