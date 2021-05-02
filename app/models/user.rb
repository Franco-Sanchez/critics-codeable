class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :critics, as: :criticable, dependent: :destroy

  validates :email, :username, presence: true, uniqueness: true

  # validate birth_date
end
