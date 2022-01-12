Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about"

  resources :users, only: [:show,:index,:edit,:update]

  resources :shops do
    resources :favorites , only:[:create ,:destroy]
    resources :shop_comments ,only:[:create, :destroy]
  end


end
