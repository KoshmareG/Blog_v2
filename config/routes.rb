Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  root to: "articles#index" 

  get 'home/index'
  get 'about', action: :show, controller: 'about'
  get 'search', action: :index, controller: 'search'

  resources :articles do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resource :contacts, only: [:new, :create], path_names: {:new => ''}
  resource :terms,  only: [:show]
  resources :profiles, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
