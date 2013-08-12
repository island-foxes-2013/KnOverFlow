KnOverFlow::Application.routes.draw do
  resources :questions do
    resources :votes, only: [:create]
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :answers, only: [:new, :create, :edit, :update, :destroy] 
  end

  resources :answers, only: [:edit, :update, :destroy] do
  	resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :votes, only: [:create]
  end

  root to: 'questions#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
