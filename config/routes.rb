Rails.application.routes.draw do
  resources :chips, only: [:index]
end
