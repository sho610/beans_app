Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about"
  get "/search", to: 'searchs#search'
  get "/prefectures/new", to: "prefectures#new"
  get "/prefectures" , to: "prefectures#index"
  post "/prefectures", to: "prefectures#create"


  resources :users, only: [:show,:index,:edit,:update]


  resources :shops do
    resource :favorites , only:[:create ,:destroy]
    resources :shop_comments ,only:[:create, :destroy]
  end


end
