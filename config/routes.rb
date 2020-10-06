Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  root 'home#top'
  get "home/about" => "home#about"
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  devise_for :users
  resources :books, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :create, :edit, :update, :index] do
    resource :relationships, only: [:follow, :unfollow]
    get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
