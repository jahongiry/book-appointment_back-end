class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :car_id, :reservation_date, :location, :car, :user

  def car
    object.car
  end

  def user
    object.user
  end
end
