Rails.application.routes.draw do
  root to: 'static_pages#index'
  devise_for :users, skip: [:registrations], controllers: {
          sessions: 'users/sessions',
          passwords: 'users/passwords'
  }
  devise_for :clients, controllers: {
          sessions: 'users/sessions',
          passwords: 'clients/passwords'
          registrations: 'clients/registrations',
  }
  devise_for :admins, skip: [:registrations], controllers: {
          sessions: 'users/sessions',
          passwords: 'admins/passwords'
  }

  resources :cities
  resources :airports
  resources :airlines
  resources :flights

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html∫
end
