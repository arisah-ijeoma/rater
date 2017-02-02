Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  root 'landing#index'
  resources :home, only: :index
end
