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
    root :to => "devise/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users, only: [:index, :show, :post, :destroy]
    resources :posts, only: [:index, :destroy]
    resources :genres, only: [:index, :show, :destroy]
    resources :abouts, only: [:index, :new, :create]
    get 'user/search', to: 'users#search', as: 'user_search'
    get 'posts/search', to: 'posts#search', as: 'post_search'
  end

  namespace :end_user do
    resources :users, only: [:check, :show, :edit, :update, :destroy]
    get 'users/:id/following', to: 'users#following', as: 'following'
    get 'users/:id/followed', to: 'users#followed', as: 'followed'
    get 'users/:id/nice', to: 'users#nice', as: 'nice'
    get 'users/:id/check', to: 'users#check', as: 'check'
    resources :posts, only: [:index, :new, :create] do
      resource :nices, only: [:create, :destroy]
    end
    get 'user/search', to: 'users#search', as: 'user_search'
    get 'post/search', to: 'posts#search', as: 'post_search'
    resources :genres, except: [:destroy,:edit,:update,:new]
    resource :relation, only: [:create, :destroy]
    resources :comments, only: [:create]
    get 'about' => 'abouts#index'
  end
end
