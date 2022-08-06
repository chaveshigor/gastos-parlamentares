# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :expense_type do
    code { Random.rand(10**5).to_s }
    description { Faker::ChuckNorris.fact }
  end
end
