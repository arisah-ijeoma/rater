Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  root 'landing#index'
  resources :home, only: :index
  resources :profiles, except: [:index, :new, :create]
  resources :politicians
  resources :brands
  resources :churches do
    resources :pastors, except: [:index, :show]
  end
  resources :schools do
    resources :lecturers, except: [:index, :show]
  end

  Blogo::Routes.mount_to(self, at: '/blog')
  # match 'heart', to: 'hearts#heart', via: :post
  # match 'unheart', to: 'hearts#unheart', via: :delete
end
