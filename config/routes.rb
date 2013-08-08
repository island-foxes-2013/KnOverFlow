KnOverFlow::Application.routes.draw do
  resources :questions
  root to: 'questions#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
