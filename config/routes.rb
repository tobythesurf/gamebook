Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    delete 'logout', to: 'users/sessions#destroy'
  end
  resources :scenarios
  resources :books
end