KnOverFlow::Application.routes.draw do
  resources :questions
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
