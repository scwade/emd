ActionController::Routing::Routes.draw do |map|

### Map login and logout urls to user_sessions actions
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.resources :user_sessions
  map.resources :users
  map.resources :password_resets
  map.resources :patient
  map.resources :patient_profiles, :reference_address
  map.resources :patient_conditions
  map.resources :conditions
  map.resources :editransactions
  map.resources :audit, :member => { :show_filter => :get }

  ###remove SCW  map.resources :my_record - TODO - clean up my_record in CSS

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
  # For audit_filter view to show an audit record.
  map.connect 'audit/show_filter/:id', :controller => 'audit', :action => 'show_filter'
  map.connect 'audit/show_filter/1/:id', :controller => 'audit', :action => 'show'
  #map.connect 'javascripts/show_record/:id', :controller => 'javascripts', :action => 'show_record'
  
  ### Enable javascript table row mouse selector for show action
  map.connect 'javascripts/show_record/.', :controller => 'javascripts', :action => 'show_record'
  
  ### Enable javascript dynamic state lookup from city 
  map.connect 'javascripts/dynamic_states/.', :controller => 'javascripts', :action => 'dynamic_states'

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => 'patient_profiles', :action => 'index'
  map.root :users
  #### rmh for testing map.root :controller => 'user_sessions', :action => 'new'
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
  # map.connect ':controller/:action.:format'
end
