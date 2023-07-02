Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :hello, only: %i[index]

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end

      resources :users do
        collection do
          get 'search'
        end
      end

      resources :notes do
        collection do
          get 'search'
        end
      end

      resources :companies do
        collection do
          get 'search'
        end
      end

    end
  end
end
