BetaMiners::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks:
             'omniauth_callbacks'}

  root to: 'projects#index'

  resources :users

  resources :projects do
    resources :test_phases
    get :control_panel
  end
end
