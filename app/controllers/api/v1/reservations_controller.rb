class API::V1::ReservationsController < ApplicationController
  before_action :authorize_request, only: %i[add_reservation my_reservations]

  # add a reservation
  def add_reservation
    car = Car.where(model: reservation_params[:model], id: reservation_params[:car_id]).first
    parsed_date = Date.parse(reservation_params[:reservation_date])

    if already_reserved parsed_date
      render json: { errors: 'Already reserved' }, status: :not_found
    else
      new_reservation = current_user.reservations.new(location: reservation_params[:location],
                                                      reservation_date: parsed_date, model: reservation_params[:model])
      new_reservation.user_id = current_user.id
      new_reservation.car_id = car.id
      if new_reservation.save
        render json: new_reservation, each_serializer: ReservationSerializer
      else
        render json: { error: 'Bad Request' }, status: :not_acceptable
      end
    end
  end

  def my_reservations
    render json: current_user.reservations, each_serializer: ReservationSerializer
  end

  private

  def already_reserved(parsed_date)
    reserved = Reservation.where(model: reservation_params[:model], location: reservation_params[:location],
                                 reservation_date: parsed_date).first
    return false if reserved.blank?

    true
  end

  def authorize_request
    render json: { errors: 'User not authorised, please sign in' }, status: :unauthorized unless current_user
  end

  def reservation_params
    params.permit(:user_id, :car_id, :location, :reservation_date, :model)
  end
end
