Rails.application.routes.draw do

  resources :appointments
  #resources :users

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'sessions/failure'

  get 'site/index'
  get 'site/salons'

  #Omniauth Routes
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  post '/signout' => 'sessions#destroy', :as => :signout

  resources :salons do #, param: :name
    resources :products
    resources :salon_images
  end

  root 'salons#index'

end
