Rails.application.routes.draw do
  resources :chips, only: [:index]
  resources :oil_types, only: [:index, :show], param: :name
end
