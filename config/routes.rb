Rails.application.routes.draw do



  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'follows', on: :member
    get 'followers', on: :member
  end
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end


  root to: "posts#index"
end
