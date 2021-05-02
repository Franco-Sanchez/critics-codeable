class InvolvedCompany < ApplicationRecord
  belongs_to :company
  belongs_to :game

  validates :type, presence: true
  validates :company_id, :game_id, uniqueness: true
end
