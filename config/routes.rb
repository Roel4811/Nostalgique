Rails.application.routes.draw do
  root to: 'pages#index'
  namespace :api do
    namespace :v1 do
      resources :songs, only: [:index, :create, :destroy, :update]
    end
  end
end
