class Car < ApplicationRecord
  has_one_attached :image
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, presence: true, length: { maximum: 55 }
  validates :model, presence: true, length: { maximum: 55 }
  validates :cost, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates :owner, presence: true
end
