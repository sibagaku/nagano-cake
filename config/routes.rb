Rails.application.routes.draw do
  
  #ながのCAKEのトップページ
  root to:"public/homes#top"
  
  #Aboutページ画面
  get "public/homes/about" => "public/homes#about", as:"about"
  
  #会員のマイページ画面
  get "customers/mypage" => "public/customers#show", as:"mypage"
  
  #退会確認画面
  get "customers/unsubscribe" => "public/customers#unsubscribe", as:"unsubscribe"
  
  #退会処理（論理削除）のルーティング
  patch "customers/:id/withdrawal" => "public/customers#withdrawal", as:"withdrawal"
  
  delete "/cart_items" => "public/cart_items#destroy_all"
  
  scope module: :public do
    resources :items, only:[:index, :show]
    resources :customers, only:[:edit, :update]
    resources :cart_items, only:[:index, :create, :update, :destroy]
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end
  
  #管理者の注文一覧画面
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
