Rails.application.routes.draw do
  root to: 'public/books#index'
  namespace :admin do
    resources :books
    resources :scenarios
    resources :profiles
  end
  scope module: :public do
    resources :books
    resources :scenarios
    resources :profiles
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    delete 'logout', to: 'users/sessions#destroy'
  end
end