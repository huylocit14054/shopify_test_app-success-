Rails.application.routes.draw do
  
  controller :session do
  	get 'login' => :new, :as => :login
  	post 'login' => :create, :as => :authenticate
  	get 'auth/shopify/callback'=> :callback
  	get 'logout' => :destroy , :as => :logout
  end 
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
