Rails.application.routes.draw do
  resources :chips, only: [:index]
  resources :oil_types, only: [:index, :show], param: :name
  resources :cart_chips, only: [:create]
  get '/:name', to: redirect('/oil_types/%{name}'), as: "oil_name"
end
