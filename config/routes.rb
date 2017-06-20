Rails.application.routes.draw do
  devise_for :users
  root "movies#index"
  resources :movies do
    resources :reviews
    member do
      post :join
      post :quit
    end
  end
end
