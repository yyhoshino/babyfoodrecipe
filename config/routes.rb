Rails.application.routes.draw do
  devise_for :users
  root to:"recipes#index"
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show do
    member do
      get :favorites
    end
  end
end
