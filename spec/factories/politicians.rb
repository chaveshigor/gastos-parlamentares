# frozen_string_literal: true

require 'cpf_faker'
require 'faker'

FactoryBot.define do
  factory :politician do
    name { Faker::Name.name }
    cpf { Faker::CPF.numeric }
    registration_id { Random.rand(10**5).to_s }
    wallet { Random.rand(10**5).to_s }
    uf { 'RJ' }
    legislature { build(:legislature) }
    political_party { build(:political_party) }

    trait :with_expenses do
      after(:build) do |politician|
        politician.expenses = build_list(:expense, 5)
      end
    end
  end
end
