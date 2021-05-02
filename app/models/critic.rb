class Critic < ApplicationRecord
  belongs_to :criticable, polymorphic: true
  belongs_to :user, counter_cache: true
  belongs_to :game

  validates :title, :body, presence: true
  validates :title, length: { maximum: 40 }
end
