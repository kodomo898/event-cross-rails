Rails.application.routes.draw do
 root to: "home#top"
 get 'about', to: 'home#about'
 get 'signup', to: 'users#new'
 get 'login', to: 'users#login_form'
 post 'login', to: 'users#login'
 post 'logout', to: 'users#logout'


 # get 'users/index' => 'users#index'
 # get 'users/:id' => 'users#show'
 # get 'users/:id/edit' => 'users#edit'
 # post 'users/:id/update' => 'users#update'
 # get 'signup' => 'users#new'
 # post 'users/create' => 'users#create'
 # get 'login' => 'users#login_form'
 # post 'login' => 'users#login'
 # post 'logout' => 'users#logout'

 # get 'posts/index' => 'posts#index'
 # get 'posts/new' => 'posts#new'
 # post 'posts/create' => 'posts#create'
 # get 'posts/:id' => 'posts#show'
 # get 'posts/:id/edit' => 'posts#edit'
 # post 'posts/:id/update' => 'posts#update'
 # post 'posts/:id/destroy' => 'posts#destroy'
 # get '/' => 'home#top'
 # get 'about' => 'home#about'
 resources :users
 resources :home
 resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
