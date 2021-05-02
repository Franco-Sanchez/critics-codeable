class Critic < ApplicationRecord
  belongs_to :criticable, polymorphic: true
  belongs_to :user, counter_cache: true
  belongs_to :game
end
