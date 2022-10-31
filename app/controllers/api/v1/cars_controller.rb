class CarsController < ApplicationController
    def all_cars
        render json: Car.all.order(id: :desc), each_serializer: CarSerializer
    end
end
