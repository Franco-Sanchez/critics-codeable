class Game < ApplicationRecord
  has_one_attached :cover

  belongs_to :parent, class_name: 'Game', optional: true
  has_many :expansions, class_name: 'Game', foreign_key: 'parent_id',
                        inverse_of: false, dependent: :nullify
end
