Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users, only: [:index, :show, :post, :destroy]
    resources :posts, only: [:index, :destroy]
    resources :abouts, only: [:index, :edit, :update]
  end

  namespace :end_user do
    resources :users, only: [:show, :edit, :updatte, :destroy, :following, :followed, :post, :nice, :check]
    resources :posts, only: [:index, :new, :create] do
      resource :nices, only: [:create, :destroy]
    end
    resources :comments, only: [:create]
    get 'about' => 'abouts#index'
  end
end
