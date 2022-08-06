# frozen_string_literal: true

class PoliticalParty < ApplicationRecord
  has_many :politicians

  validates :name, presence: true, uniqueness: true
end
