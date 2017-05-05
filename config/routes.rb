Rails.application.routes.draw do
  
  # Routes for main resources
  resources :items
  resources :purchases
  resources :item_prices
  resources :sessions
  resources :users
  resources :orders
  resources :schools
  resources :credit_cards
  #resources :cart

  # Semi-static page routes
  get 'home' => 'home#home', as: :home
  get 'about' => 'home#about', as: :about
  get 'contact' => 'home#contact', as: :contact
  get 'privacy' => 'home#privacy', as: :privacy
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout
  
  # Sub-pages for items
  get 'boards' => 'items#boards', as: :boards
  get 'pieces' => 'items#pieces', as: :pieces
  get 'clocks' => 'items#clocks', as: :clocks
  get 'supplies' => 'items#supplies', as: :supplies 

  # For cart routes
  get 'cart_update/:item_id' => 'cart#update', as: :cart_update
  get 'cart_index' => 'cart#index', as: :cart_index
  get 'cart_remove/:item_id' => 'cart#remove', as: :cart_remove
  #get 'cart_save/:order_id' => 'cart#checkout', as: :cart_checkout
  
  # Set the root url
  root :to => 'home#home'  

end
