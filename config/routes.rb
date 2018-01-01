Rails.application.routes.draw do
  root to: 'songs#index'
  namespace :api do
    namespace :v1 do
      resources :songs, only: [:index, :create, :destroy, :update]
    end
  end

  get '/donate', to: 'orders#new', as: 'new_order'
  get '/thankyou', to: 'orders#confirmation', as: 'orders_confirmation'
  get '/pay', to: 'orders#pay', as: 'pay_order'
  get '/donate/register', to: 'orders#new_member'
  resources :songs
  resources :artists

  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout_session'
  get '/signup', to: 'members#new'
  post '/members', to: 'members#create'

  get '/translate/:id', to: 'songs#translate', as: 'translate_song'
end
