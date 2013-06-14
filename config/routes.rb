BetaMiners::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks:
             'omniauth_callbacks'}

  root to: 'home#index'

  resources :users

  resources :projects do
    resources :registrations
    resource :feedback

    resources :test_phases do
      resource :survey do
        get :results
      end
    end

    get :control_panel
  end


end
