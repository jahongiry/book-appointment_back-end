class API::V1::ReservationsController < ApplicationController
  before_action :authorize_request, only: %i[my_reservations add_reservation destroy]

  # add a reservation
  def add_reservation
    parsed_date = Date.parse(reservation_params[:reservation_date])

    if already_reserved(parsed_date, reservation_params[:car_id])
      render json: { errors: 'Already reserved' }, status: :not_found
    else
      new_reservation = Reservation.new(location: reservation_params[:location],
                                        reservation_date: parsed_date, model: reservation_params[:model])
      new_reservation.user_id = current_user.id
      new_reservation.car_id = reservation_params[:car_id] if Car.find(reservation_params[:car_id])
      if new_reservation.save
        render json: new_reservation, each_serializer: ReservationSerializer
      else
        render json: { error: 'Bad Request' }, status: :not_acceptable
      end
    end
  end

  def my_reservations
    reservations = Reservation.all
    render json: reservations, each_serializer: ReservationSerializer
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    render json: { message: 'Reservation deleted' }
  end

  private

  def already_reserved(parsed_date, car_id)
    reserved = Reservation.where(location: reservation_params[:location],
                                 reservation_date: parsed_date, car_id:).first
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
