Rails.application.routes.draw do

  devise_for :users, only: [:passwords]

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      devise_for :users, only: [:sessions], controllers: { sessions: 'api/v1/users/sessions' }

      resources :users, only: [] do
        collection do
          post 'sign_up'
          put  'password', to: 'users#update_password'
        end
      end

      resources :occasions
    end
  end
end
