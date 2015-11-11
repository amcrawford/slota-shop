Rails.application.routes.draw do
  root to: 'pages#home'
  resources :chips, only: [:index, :show]
  resources :oils, only: [:index, :show], param: :slug
  resources :cart_chips, only: [:create, :index, :destroy, :update]
  resources :users, only: [:new, :create, :show] do
    resources :orders, only: [:index]
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  get '/cart', to: redirect('/cart_chips')
  get '/:slug', to: redirect('/oils/%{slug}'), as: "oil_name"
end
