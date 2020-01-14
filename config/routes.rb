Rails.application.routes.draw do
  root 'home#top'
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations'
  }
  devise_scope :user do
    get "signup/registration" => "users/registrations#new"
    get "users/sign_out" => "users/sessions#destroy"
  end
end