Bikexyz::Application.routes.draw do

  get "verify/:auth_id/:auth_key", :to => 'verify#index', :as => :verify
  get "verify/signout", :to => 'verify#signout', :as => :signout
  get "verify/:xyz_code(/:which_email)", :to => 'verify#send_email', :as => :send_verify_email

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout", sign_up: "new-account" }

  get 'faq', :to => 'pages#faq', :as => :faq
  get 'search', :to => 'pages#search', :as => :search
  get 'about', :to => 'pages#about', :as => :about
  get 'contact', :to => 'pages#contact', :as => :contact

  #        bike_regs GET    /bike_regs(.:format)                       bike_regs#index
  get "recent", :to => 'bike_regs#index', :as => :recent_bike_regs
  get "mine", :to => 'bike_regs#mine', :as => :my_bike_regs
  #                  POST   /bike_regs(.:format)                       bike_regs#create
  post 'register', :to => 'bike_regs#create', :as => :create_bike_reg
  #     new_bike_reg GET    /bike_regs/new(.:format)                   bike_regs#new
  get 'register', :to => 'bike_regs#new', :as => :new_bike_reg
  #    edit_bike_reg GET    /bike_regs/:id/edit(.:format)              bike_regs#edit
  get ':xyz_code/edit', :to => 'bike_regs#edit', :as => :edit_bike_reg
  #         bike_reg GET    /bike_regs/:id(.:format)                   bike_regs#show
  get ':xyz_code(.:format)', :to => 'bike_regs#show', :as => :bike_reg
  #                  PUT    /bike_regs/:id(.:format)                   bike_regs#update
  put ':xyz_code', :to => 'bike_regs#update', :as => :update_bike_reg


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
