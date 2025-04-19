Rails.application.routes.draw do
  resources :reviews
  get "dinamicas/random", to: "dinamicas#random"

  resources :dinamicas do
    resources :reviews, only: [:new, :create]
  end
  
  root "dinamicas#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
