Rails.application.routes.draw do
  root 'home#profile'

  devise_for :users

end
