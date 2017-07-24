Rails.application.routes.draw do

root to: 'welcome#index'

  namespace :api do
      namespace :v1 do

        mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]

        resources :contacts
    end
  end
end
