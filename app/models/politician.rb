# frozen_string_literal: true

class Politician < ApplicationRecord
  belongs_to :legislature

  validates_presence_of :name, :uf
  validates_uniqueness_of :cpf, :registration_id, :wallet
end
