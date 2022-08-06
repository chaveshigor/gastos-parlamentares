# frozen_string_literal: true

class Politician < ApplicationRecord
  belongs_to :legislature
  belongs_to :political_party

  validates_presence_of :name, :uf
  validates_uniqueness_of :cpf, :registration_id, :wallet

  def self.picture
    "https://www.camara.leg.br/internet/deputado/bandep/#{registration_id}.jpg"
  end
end
