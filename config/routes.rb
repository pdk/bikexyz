Bikexyz::Application.routes.draw do

  get "x/order", :to => 'order#index', :as => :orders
  post "x/order", :to => 'order#create', :as => :orders

  get "x/verify/:auth_id/:auth_key", :to => 'verify#index', :as => :verify
  get "x/verify/signout", :to => 'verify#signout', :as => :signout
  match "x/verify/:xyz_code", :to => 'verify#send_email', :as => :send_verify_email, :via => [:get, :post]

  get 'x/faq', :to => 'pages#faq', :as => :faq
  get 'x/marking', :to => 'pages#marking', :as => :marking
  get 'x/why', :to => 'pages#why', :as => :why
  get 'x/changethegame', :to => 'pages#changethegame', :as => :changethegame
  
  
  get 'x/about', :to => 'pages#about', :as => :about
  get 'x/contact', :to => 'pages#contact', :as => :contact
  get 'x/handout', :to => 'pages#handout', :as => :handout
  get 'x/pledge', :to => 'pages#pledge', :as => :xpledge
  get 'x/more', :to => 'pages#more', :as => :more
  
  get 'x/search', :to => 'bike_regs#search', :as => :search
  get "x/recent", :to => 'bike_regs#index', :as => :recent_bike_regs
  get "x/mine", :to => 'bike_regs#mine', :as => :my_bike_regs
  post 'register', :to => 'bike_regs#create', :as => :bike_regs
  get 'register', :to => 'bike_regs#new', :as => :new_bike_reg
  
  get ':xyz_code/edit', :to => 'bike_regs#edit', :as => :edit_bike_reg
  get ':xyz_code(.:format)(/)', :to => 'bike_regs#show', :as => :bike_reg
  match ':xyz_code', :to => 'bike_regs#update', :as => :update_bike_reg, :via => [:put, :post]
  match ':xyz_code/photo', :to => 'bike_regs#add_photo', :as => :bike_reg_add_photo, :via => [:put, :post]
  
  get ':xyz_code/photo/:photo_number', :to => 'bike_regs#photo', :as => :bike_reg_photo

  post "incoming-email/#{ENV['POSTMARK_INCOMING_PATH']}", :to => 'incoming_email#register', :as => :email_register
  post "bounce-email/#{ENV['POSTMARK_INCOMING_PATH']}", :to => 'incoming_email#bounce', :as => :email_bounce

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

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout", sign_up: "new-account" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
