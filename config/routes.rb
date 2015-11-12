Rails.application.routes.draw do
  root to: 'pages#home'
  resources :oils, only: [:index, :show], param: :slug
  resources :chips, only: [:index, :show]
  resources :cart_chips, only: [:create, :index, :destroy, :update]
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :chips, only: [:index, :show, :create, :new, :update, :edit]
 end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  get '/cart', to: redirect('/cart_chips')
  get '/:slug', to: redirect('/oils/%{slug}'), as: "oil_name"
end
