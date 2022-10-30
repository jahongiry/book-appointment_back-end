Rails.application.routes.draw do
      namespace :api do
            namespace :v1 do
                  post "/signup", to: "users#create"
                  post "/signin", to: "sessions#create"
                  get "/authorized", to: "sessions#show"
            end
      end
end
