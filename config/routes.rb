ActionController::Routing::Routes.draw do |map|
  map.resources :users, :performances

  # config/routes.rb
  map.resource :user_session
  map.root :controller => "performances"
    
  map.resource :account, :controller => "users"
end
