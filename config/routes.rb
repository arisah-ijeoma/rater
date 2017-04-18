Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  root 'landing#index'
  resources :home, only: :index
  resources :profiles, except: [:index, :new, :create]
  resources :tags, only: [:index, :destroy]

  get '/pastors/tags/new' => 'tags#new'
  get '/pastors/tags/:id/edit' => 'tags#edit', as: 'edit_tag_pastors'

  get '/lecturers/tags/new' => 'tags#new'
  get '/lecturers/tags/:id/edit' => 'tags#edit', as: 'edit_tag_lecturers'

  resources :politicians do
    get '/tags/new' => 'tags#new', on: :collection
    post '/tags' => 'tags#create', on: :collection
    get '/tags/:id/edit' => 'tags#edit', on: :collection, as: 'edit_tag'
    put '/tags/:id' => 'tags#update', on: :collection
    get :rating
    post :ratings
  end
  resources :brands do
    get '/tags/new' => 'tags#new', on: :collection
    post '/tags' => 'tags#create', on: :collection
    get '/tags/:id/edit' => 'tags#edit', on: :collection, as: 'edit_tag'
    put '/tags/:id' => 'tags#update', on: :collection
    get :rating
    post :ratings
  end
  resources :churches do
    get '/tags/new' => 'tags#new', on: :collection
    post '/tags' => 'tags#create', on: :collection
    get '/tags/:id/edit' => 'tags#edit', on: :collection, as: 'edit_tag'
    put '/tags/:id' => 'tags#update', on: :collection
    get :rating
    post :ratings
    resources :pastors, except: [:index, :show] do
      post '/tags' => 'tags#create', on: :collection
      get '/tags/:id/edit' => 'tags#edit', on: :collection, as: 'edit_tag'
      put '/tags/:id' => 'tags#update', on: :collection
      get :rating
      post :ratings
    end
  end
  resources :schools do
    get '/tags/new' => 'tags#new', on: :collection
    post '/tags' => 'tags#create', on: :collection
    get '/tags/:id/edit' => 'tags#edit', on: :collection, as: 'edit_tag'
    put '/tags/:id' => 'tags#update', on: :collection
    get :rating
    post :ratings
    resources :lecturers, except: [:index, :show] do
      post '/tags' => 'tags#create', on: :collection
      get '/tags/:id/edit' => 'tags#edit', on: :collection, as: 'edit_tag'
      put '/tags/:id' => 'tags#update', on: :collection
      get :rating
      post :ratings
    end
  end

  Blogo::Routes.mount_to(self, at: '/blog')
  # match 'heart', to: 'hearts#heart', via: :post
  # match 'unheart', to: 'hearts#unheart', via: :delete
end
