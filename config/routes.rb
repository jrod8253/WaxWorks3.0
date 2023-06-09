Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :releases, only: [:new, :create, :show, :index] do
    resources :listings, only: [ :new, :create ]
    resources :favorites, :reviews, only: [ :new, :create ]
  end

  resources :listings do
    resources :orders, only: [ :new, :create ]
  end
  
  resources :ownerships, only: [ :index, :new, :create ]

  resources :listings, only: [ :index, :destroy, :show ]

  resources :orders, only: [ :show, :create, :index, :edit ]

  resources :favorites, only: [ :index, :update ]

end
