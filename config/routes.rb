Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      #resources :messages, only: [:index]
      post "/signup", to: "users#create"
      post "/login", to: "sessions#create"
      get "/authorized", to: "sessions#show"
    end
  end
end
