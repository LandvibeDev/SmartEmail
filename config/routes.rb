Rails.application.routes.draw do
  devise_for :users

  resources :groups, only: [:index] do
    resource :users
    resource :contents
  end

  resources :userpop3s, only: [:index] do
    resources :usermails
  end

  resources :users do
    get 'inviteShow'
    get 'all'

    resources :groups do
      get 'join'
      get 'inviteCreate'
      get 'invite'
    end
  end

  resources :events
  resources :invites do
    delete 'destroy'
  end

  get 'home/index'
  get 'userpop3/setpop/:id' => 'userpop3#setpop'

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
