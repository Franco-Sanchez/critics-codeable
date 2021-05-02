class Game < ApplicationRecord
  has_one_attached :cover

  belongs_to :parent, class_name: 'Game', optional: true
  has_many :expansions, class_name: 'Game', foreign_key: 'parent_id',
                        inverse_of: false, dependent: :nullify

  has_many :critics, as: :criticable, dependent: :destroy
  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :genres
end
