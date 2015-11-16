Rails.application.routes.draw do
  post 'notifications/notify' => 'notifications#notify'
  post 'twilio/voice' => 'twilio#voice'
  root to: 'pages#home'
  resources :oils, only: [:index, :show], param: :slug
  resources :chips, only: [:index, :show], param: :slug
  resources :cart_chips, only: [:create, :index, :destroy, :update]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :orders, only: [:index, :create, :show, :new]
  namespace :admin do
    resources :chips, only: [:index, :show, :create, :new, :update, :edit, :destroy]
    resources :dashboard, only: [:index, :show]
    resources :orders, only: [:index]
 end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  get '/cart', to: 'cart_chips#index'
  get '/:slug', to: 'oils#show'
  # get '/:slug', to: redirect('/oils/%{slug}'), as: "oil_name"
end
