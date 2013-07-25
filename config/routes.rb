AjaxDemo::Application.routes.draw do
  root :to => "Users#new"

  resource :session
  resources :users do
    resources :secrets, only: [:create]
    resources :friendships, only: [:create]
  end

  resource :friendships, only: [:destroy]
end
