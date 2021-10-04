class Game < ApplicationRecord
  has_one_attached :cover

  enum category: { main_game: 0, expansion: 1 }

  belongs_to :parent, class_name: 'Game', optional: true
  has_many :expansions, class_name: 'Game', foreign_key: 'parent_id',
                        inverse_of: false, dependent: :nullify
  has_many :critics, as: :criticable, dependent: :destroy
  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :genres
  has_many :involved_companies, dependent: :destroy
  has_many :companies, through: :involved_companies

  validates :name, :category, presence: true
  validates :name, uniqueness: true
  validates :rating, inclusion: { in: 0..100 }, allow_nil: true
  validate :parent_validation
  validate :not_be_in_the_future

  def sorted_critics
    critics.order(created_at: :desc)
  end

  private

  def parent_validation
    if main_game?
      errors.add(:parent_id, 'Should be null if is a main game') unless parent_id.nil?
    elsif expansion?
      errors.add(:parent_id, 'Should be a valid Game id') unless Game.exists?(parent_id)
    end
  end

  def not_be_in_the_future
    return unless released_date && Time.zone.today < released_date

    errors.add(:released_date, "Shouldn't be in the future")
  end
end
