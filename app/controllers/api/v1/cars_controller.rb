class API::V1::CarsController < ApplicationController
  before_action :authorize_request, only: %i[add_car]

  # list all cars
  def all_cars
    render json: Car.all.order(id: :desc), each_serializer: CarSerializer
  end

  # get a car
  def show_car
    car = Car.find(params[:id])
    raise ActiveRecord::RecordNotFound unless car
    render json: car, each_serializer: CarSerializer
  end

  # create a new car item
  def add_car
    car = Car.new(cars_params)
    car.owner = current_user.username
    if car.save
      render json: car, each_serializer: CarSerializer
    else
      render json: { error: 'Bad Request' }, status: :not_acceptable
    end
  end

  private

  def authorize_request
    unless current_user
        render json: { errors: 'User not authorised, please sign in' }, status: :unauthorized
    end
  end

  def cars_params
    params.permit(:name, :cost, :description, :image)
  end
end
