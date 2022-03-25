Rails.application.routes.draw do
  get 'home/index'
  get 'about', action: :show, controller: 'about'

  resources :articles, only: [:index, :new, :create]
  resource :contacts, only: [:new, :create], path_names: {:new => ''}
  resource :terms,  only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
