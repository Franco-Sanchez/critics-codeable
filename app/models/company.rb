class Company < ApplicationRecord
  has_many :involved_companies, dependent: :destroy
  has_many :games, through: :involved_companies

  validates :name, presence: true, uniqueness: true
end
