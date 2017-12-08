Rails.application.routes.draw do
  root to: 'pages#index'
  namespace :api do
    namespace :v1 do
      resources :songs, only: [:index, :create, :destroy, :update]
    end
  end

  get '/donate', to: 'orders#new', as: 'new_order'
  get '/thankyou', to: 'orders#confirmation', as: 'orders_confirmation'
  get '/pay', to: 'orders#pay', as: 'pay_order'
  resources :songs
end
