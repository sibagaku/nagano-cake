Rails.application.routes.draw do
  
  root to:"public/homes#top"
  get "public/homes/about" => "public/homes#about", as:"about"
  
  namespace :public do
    resources :items, only:[:index, :show]
    resources :customers, only:[:show, :edit, :update]
    resources :cart_items, only:[:index, :create, :update, :destroy]
    resources :orders, only:[:new, :create, :index, :show]
    resources :address, only:[:index, :create, :edit, :update, :destroy]
  end
  get "/admin" => "admin/homes#top", as:"admin"
  
  namespace :admin do
    resources :items, only:[:new, :create, :index, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
     resource :order_items, only:[:update]
  end
 
  
  #顧客用
  #　URL　/customers/sign_in...
  devise_for :customers,skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
  }
  
  
  #管理者用
  # URL /admin/sign_in...
  devise_for :admin,skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  
  
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
