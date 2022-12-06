Rails.application.routes.draw do
  devise_for :users
  root to:"recipes#index"
  resources :recipes do
    collection do
      get 'search'
      resource :favorites, only: [:create, :destroy]
    end
  end
  resources :users, only: :show
end
