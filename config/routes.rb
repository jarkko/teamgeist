ActionController::Routing::Routes.draw do |map|
  map.resources :users
  
  map.resources :performances do |perf|
    perf.resources :mistakes
  end

  # config/routes.rb
  map.resource :user_session
  map.root :controller => "performances"
    
  map.resource :account, :controller => "users"
end
