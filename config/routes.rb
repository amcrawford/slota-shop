Rails.application.routes.draw do
  resources :chips, only: [:index]
  resources :oils, only: [:index, :show], param: :slug
  resources :cart_chips, only: [:create, :index]
  get '/:slug', to: redirect('/oils/%{slug}'), as: "oil_name"
end
