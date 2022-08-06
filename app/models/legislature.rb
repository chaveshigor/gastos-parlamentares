class Legislature < ApplicationRecord
  has_many :politicians

  validates :year, presence: true
  validates :code, presence: true, uniqueness: true
end
