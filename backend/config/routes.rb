Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1, format: 'json' do 
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }
      resources :plans, only: %i[index show create update destroy]
      resources :users, only: %i[index show] 
      resources :joins, only: %i[create destroy] 
      resource :relationships, only: %i[create destroy]
    end
  end
end
