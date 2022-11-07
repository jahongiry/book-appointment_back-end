class API::V1::CarsController < ApplicationController
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
    car.owner = current_user.id
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

  def cars_params
    params.permit(:name, :cost, :owner, :description, :image_url, :model, :image)
  end
end
