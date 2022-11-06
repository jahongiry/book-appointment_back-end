class API::V1::CarsController < ApplicationController
  before_action :authorize_request, only: %i[add_car destroy]

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
    image_url = Cloudinary::Uploader.upload(params[:image])
    car = Car.new(cars_params)
    car.owner = User.find(params[:owner_id])
    car.image_url = image_url['url']

    if car.save
      render json: car, each_serializer: CarSerializer
    else
      render json: { error: 'Bad Request' }, status: :not_acceptable
    end
  end

  # delete a car item from list
  def destroy
    car = Car.find(params[:id])
    if car.destroy
      render json: { message: 'Car deleted successfully' }, status: :ok
    else
      render json: { head: unprocessable_entity }
    end
  end

  private

  def authorize_request
    render json: { errors: 'User not authorised, please sign in' }, status: :unauthorized unless current_user
  end

  def cars_params
    params.permit(:name, :cost, :description, :image, :model)
  end
end
