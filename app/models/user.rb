class User < ApplicationRecord
    has_many :reservations
    has_many :cars, through: :reservations

    validates :first_name, presence: true, length: { maximum: 55 }
    validates :last_name, presence: true, length: { maximum: 55 }
    validates :username, presence: true, uniqueness: true, length: { maximum: 55 }
end
