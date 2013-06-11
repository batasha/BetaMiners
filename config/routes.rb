BetaMiners::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks:
             'omniauth_callbacks'}

  root to: 'users#show'

  resources :users
  resources :projects
end
