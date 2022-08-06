# frozen_string_literal: true

FactoryBot.define do
  factory :expense_specification do
    code { Random.rand(10**5).to_s }
    description { Faker::ChuckNorris.fact }
  end
end
