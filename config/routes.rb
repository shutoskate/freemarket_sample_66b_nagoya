Rails.application.routes.draw do

  root 'home#top'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get '/mypage/identification', to: 'users/registrations#edit_address'
    post '/mypage/identification', to: 'users/registrations#update_address'
    get "signup/registration" => "users/registrations#new"
    post "signup/registration" => "users/registrations#create"
    get "/login" => "users/sessions#new"
    get "users/sign_out" => "users/sessions#destroy"
    get "signup" => "users/registrations#selection"
  end
  resources :users, only: [:edit, :update]
  resources :items, only: [:show, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'get_subcategory', defaults: { format: 'json' }
      get 'get_subsubcategory', defaults: { format: 'json' }
      get 'brand', defaults: { format: 'json' }
    end
  end
  resources :trades, only: [:new, :create]
  resources :purchases do
    member do
      get 'index', to: 'purchases#index'
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'
    end
  end
  resources :cards, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :categories, only: [:index, :show]
  get "/mypage" => "users#mypage"
  get "/mypage/profile" => "users#profile"
  post "/mypage/profile" => "users#profile_update"
  get "/mypage/items" => "users#items"
  get "/logout" => "users#logout"
  post "/stop/:id" => "items#stop", as: :stop
  post "/start/:id" => "items#start", as: :start
  post "/rating/:id" => "items#rating", as: :rating
  get "/search" => "items#search"
end
