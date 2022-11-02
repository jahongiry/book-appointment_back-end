class ReservationSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :car_id, :reservation_date, :location, :model
end
  