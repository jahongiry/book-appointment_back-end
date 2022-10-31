Rails.application.routes.draw do
      namespace :api do
            namespace :v1 do
                  post "/signup", to: "users#create"
                  post "/signin", to: "sessions#create"
                  get "/authorized", to: "sessions#show"
                  get "/all_cars", to: "cars#all_cars"
                  post "/add_car", to: "cars#add_car"
                  get "/show_car", to: "cars#get_car"
            end
      end
end