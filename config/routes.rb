Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/destroy'

  get 'usrs/index'

  get 'signup' , to: 'usrs#new'

  get 'usrs/create'

  get 'usrs/edit'

  get 'usrs/update'

  get 'usrs/destroy'

  

  get 'about' => 'about#index'

  get "contacts" => 'contacts#new'

  get 'contacts/create'

  namespace :admin do
  get 'login' => 'sessions#new' ,  :as => 'login'
  end

  namespace :admin do
  get 'logout' => 'sessions#destroy' ,  :as => 'logout'
  end

  namespace :admin do
  get 'sessions/create'
  end

  namespace :admin do
  get 'users/new'
  end

  namespace :admin do
  get 'users/create'
  end

  namespace :admin do
  get 'users/edit'
  end

  namespace :admin do
  get 'users/update'
  end

  namespace :admin do
  get 'users/destroy'
  end

  namespace :admin do
  get 'users/index'
  end

  namespace :admin do
  get 'users/show'
  end

  namespace :admin do
  get 'comments/destroy'
  end

  get 'comments/new'

  namespace :admin do
  get 'categories/new'
  end

  namespace :admin do
  get 'categories/create'
  end

  namespace :admin do
  get 'categories/edit'
  end

  namespace :admin do
  get 'categories/update'
  end

  namespace :admin do
  get 'categories/destroy'
  end

  namespace :admin do
  get 'categories/index'
  end

  namespace :admin do
  get 'categories/show'
  end

  get 'categories/show'

  namespace :admin do
  get 'posts/new'
  end

  namespace :admin do
  get 'posts/create'
  end

  namespace :admin do
  get 'posts/edit'
  end

  namespace :admin do
  get 'posts/update'
  end

  namespace :admin do
  get 'posts/destroy'
  end

  namespace :admin do
  get 'posts/index'
  end

  namespace :admin do
  get 'posts/show'
  end

  get 'posts/index'

  get 'posts/show'

  resources :posts , :categories , :usrs , :sessions

  resources "contacts" , only: [:new, :create] 

  namespace :admin do
    resources :posts , :categories , :comments , :users, :sessions

  end

  resources :post do
    resources :comments
  end


  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  get 'logout' , to: 'sessions#destroy'
 
 root 'posts#index'



end
