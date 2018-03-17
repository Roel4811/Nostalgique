Rails.application.routes.draw do
  root to: 'songs#index'
  namespace :api do
    namespace :v1 do
      resources :songs, only: [:index, :create, :destroy, :update]
    end
  end

  namespace :admin do
    root to: "songs#index"
    resources :songs do
      post 'delete', on: :member
    end
    resources :artists, :members
    resources :users do
      collection do
        get 'log_in'
        post 'create_log_in'
        delete 'log_out'
      end
    end
  end

  get '/contact', to: 'application#contact', as: 'contact'
  resources :contact_submissions, only: [:create]

  get '/donate', to: 'orders#new', as: 'new_order'
  get '/thankyou', to: 'orders#confirmation', as: 'orders_confirmation'
  get '/pay', to: 'orders#pay', as: 'pay_order'
  get '/donate/register', to: 'orders#new'
  # get 'songs', to: 'songs#index', as: 'songs'
  resources :songs
  resources :artists

  get '/signup', to: 'members#new'
  resources :members do
    collection do
      get 'log_in'
      post 'create_log_in'
      delete 'log_out'
      get 'new_password_reset', to: "members#new_password_reset"
      post 'password_reset'
    end
  end

  get '/translate/:id', to: 'songs#translate', as: 'translate_song'

end
