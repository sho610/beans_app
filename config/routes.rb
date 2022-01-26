Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search', to: 'searchs#search'
  get '/prefectures/new', to: 'prefectures#new'
  get '/prefectures', to: 'prefectures#index'
  post '/prefectures', to: 'prefectures#create'

  resources :users, only: %i[show index edit update]

  resources :shops do
    resource :favorites, only: %i[create destroy]
    resources :shop_comments, only: %i[create destroy]
  end
end
