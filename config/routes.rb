Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users, only: [:index, :show, :post, :destroy]
    resources :posts, only: [:index, :destroy]
    resources :abouts, only: [:index, :edit, :update]
    root to:'posts#index'
  end

  namespace :end_user do
    resources :users, only: [:show, :edit, :updatte, :destroy, :following, :followed, :post, :nice, :check]
    resources :posts, only: [:index, :new, :create]
    resources :comment, only: [:create]
    resources :nice, only: [:create, :destroy]
    get 'about' => 'abouts#index'
  end
end
