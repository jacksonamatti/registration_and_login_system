Rails.application.routes.draw do
  devise_for :users
  root 'sessions#new'
  get 'sessions/new'
  resources :users
  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  get 'sign_out'  => 'sessions#destroy'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
