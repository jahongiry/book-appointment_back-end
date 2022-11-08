Rails.application.routes.draw do
      namespace :api do
            namespace :v1 do
                  post "/signup", to: "users#create"
                  post "/signin", to: "sessions#create"
                  get "/authorized", to: "sessions#show"
                  get "/all_cars", to: "cars#all_cars"
                  post "/add_car", to: "cars#add_car"
                  get "/show_car/:id", to: "cars#show_car"
                  post "/add_reservation", to: "reservations#add_reservation"
                  get "/:user_id/my_reservations", to: "reservations#my_reservations"
                  delete "/cars/:id", to:"cars#destroy"
            end
      end
end