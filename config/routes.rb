Rails.application.routes.draw do

  root 'users#logout'
  devise_for :users, :controllers => {
  :sessions => 'users/sessions',
  :registrations => 'users/registrations'
  }
  resources :users, only: [:edit, :update]
  get "/mypage" => "users#mypage"
  get "/mypage/profile" => "users#profile"
end
