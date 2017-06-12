Rails.application.routes.draw do
  
  controller :session do
  	get 'auth/shopify/callback'=> :callback
  end 
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
