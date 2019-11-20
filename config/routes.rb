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
    resources :users, only: [:check, :show, :edit, :updatte, :destroy]
    get 'users/:id/following', to: 'users#following', as: 'following'
    get 'users/:id/followed', to: 'users#followed', as: 'followed'
    get 'users/:id/nice', to: 'users#nice', as: 'nice'
    get 'users/:id/check', to: 'users#check', as: 'check'
    get 'users/:id/post', to: 'users#post', as: 'post'
    resources :posts, only: [:index, :new, :create] do
      resource :nices, only: [:create, :destroy]
    end
    resources :relations, only: [:create, :destroy]
    resources :comments, only: [:create]
    get 'about' => 'abouts#index'
  end
end
