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

    trait :with_legislature do
      after(:build) do |politician|
        politician.legislature = build(:legislature)
      end
    end

    trait :with_political_party do
      after(:build) do |politician|
        politician.political_party = build(:political_party)
      end
    end
  end
end
