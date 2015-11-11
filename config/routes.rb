Rails.application.routes.draw do
  resources :chips, only: [:index, :show]
  resources :oils, only: [:index, :show], param: :slug
  resources :cart_chips, only: [:create, :index, :destroy]
  root to: 'pages#home'
  get '/cart', to: redirect('/cart_chips')
  get '/:slug', to: redirect('/oils/%{slug}'), as: "oil_name"
end
