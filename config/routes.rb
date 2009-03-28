ActionController::Routing::Routes.draw do |map|
  map.resources :users, :performances

  # config/routes.rb
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
    
  map.resource :account, :controller => "users"
end
