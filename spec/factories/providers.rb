# frozen_string_literal: true

require 'cpf_faker'
require 'faker'

FactoryBot.define do
  factory :provider do
    name { Faker::Games::Pokemon.name }
    cnpj_cpf { Faker::CPF.numeric }
  end
end
