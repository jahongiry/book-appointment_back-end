class Reservation < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :reservation_date, presence: true
  validates :user_id, presence: true
  validates :car_id, presence: true
  validates :location, presence: true
end
