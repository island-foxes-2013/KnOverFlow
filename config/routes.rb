KnOverFlow::Application.routes.draw do
  resources :questions do
    resources :answers, only: [:new, :create]
  end
  resources :answers, except: [:new, :create]
  root to: 'questions#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
