# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :expense_type do
    code { Random.rand(10**5).to_s }
    description { Faker::ChuckNorris.fact }

    trait :with_specification do
      after(:build) do |expense_type|
        expense_type.expense_specification = build(:expense_specification)
      end
    end
  end
end
