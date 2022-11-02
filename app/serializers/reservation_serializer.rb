class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :car_id, :reservation_date, :location, :model, :car, :user

  def car
    {
      car_details: object.car
    }
  end

  def user
    {
      user_details: object.user
    }
  end
end
