KnOverFlow::Application.routes.draw do
  # this is what I'm thinking the routes should be 
  # so the user validation stuff can pass...
  # resources :users do
  #   resources :questions do
  #   	resources :comments, only: [:new, :create]
  #     resources :answers, only: [:new, :create] do
  #       resources :comments, only: [:new, :create]
  #     end
  #   end
  # end
  # resources :questions, only [:show]

  resources :questions do
    resources :votes, only: [:new, :create, :update]
    resources :comments, only: [:new, :create, :edit, :destroy]
    resources :answers, only: [:new, :create, :edit, :update, :destroy] 
  end

  # this likely needs to be removed
  resources :answers, except: [:new, :create] do
  	resources :comments, only: [:new, :create]
    resources :votes, only: [:new, :create, :update]
  end

  root to: 'questions#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
