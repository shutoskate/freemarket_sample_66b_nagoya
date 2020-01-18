Rails.application.routes.draw do

  root 'home#top'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get "signup/registration" => "users/registrations#new"
    post "signup/registration" => "users/registrations#create"
    get "/login" => "users/sessions#new"
    get "users/sign_out" => "users/sessions#destroy"
  end
  resources :users, only: [:edit, :update]
  resources :items
  get "/mypage" => "users#mypage"
  get "/mypage/profile" => "users#profile"
  post "/mypage/profile" => "users#profile_update"
  get "/logout" => "users#logout"
  get "/sell" => "items#new"
  get "/:id" => "items#show"
end
