Rails.application.routes.draw do
  root 'home#top'
  devise_for :users, :controllers => {
  :sessions => 'users/sessions',
  :registrations => 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update]
end
