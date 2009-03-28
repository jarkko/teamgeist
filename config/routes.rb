ActionController::Routing::Routes.draw do |map|
  # config/routes.rb
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
end
