# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :political_party do
    name { rand(36**8).to_s(36).upcase }
  end
end
