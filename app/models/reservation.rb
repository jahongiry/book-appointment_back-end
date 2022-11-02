class Reservation < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :reservation_date, presence: true
  validates :user_id, presence: true
  validates :car_id, presence: true
  validates :location, presence: true
  
  scope :expired, ->{ where("reservation_date < ?", Date.today) }
  

  def self.remove_expired
    Reservation.expired.delete_all
  end
end
