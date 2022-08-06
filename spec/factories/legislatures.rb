# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :legislature do
    year { Random.rand(2000...2022).to_s }
    code { Random.rand(10**5).to_s }
  end
end
