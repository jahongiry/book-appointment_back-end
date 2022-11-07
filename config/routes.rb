Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
      namespace :api do
            namespace :v1 do
                  post "/signup", to: "users#create"
                  post "/signin", to: "sessions#create"
                  get "/authorized", to: "sessions#show"
                  get "/all_cars", to: "cars#all_cars"
                  post "/add_car", to: "cars#add_car"
                  get "/show_car", to: "cars#show_car"
                  delete "/cars/:id", to:"cars#destroy"
                  
                  
            end
      end
end