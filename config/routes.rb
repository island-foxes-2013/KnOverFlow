KnOverFlow::Application.routes.draw do

  resources :questions do
  	resources :comments, only: [:new, :create]
    resources :answers, only: [:new, :create]
  end
  resources :answers, except: [:new, :create] do
  	resources :comments, only: [:new, :create]
  end
  root to: 'questions#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

end
