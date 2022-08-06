# frozen_string_literal: true

class Provider < ApplicationRecord
  validates :cnpj_cpf, presence: true, uniqueness: true
  validates :name, presence: true
end
