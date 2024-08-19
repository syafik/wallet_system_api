Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :sessions
        resources :wallets
        resources :transactions do
          collection do
            post 'deposit', as: :deposit
            post 'withdraw', as: :withdraw
            post 'transfer', as: :transfer
          end
        end
      end
    end
  end
end
