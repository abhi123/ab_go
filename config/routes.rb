DeviseApp::Application.routes.draw do
  
  resources :messages do
    collection do
      get "sent_mail"
      get "show_sent_mail"
    end
  end

  resources :profile do
    collection do
      get "user_profile"
    end
  end
  
  resources :search do
    collection do
      get "search_user"
    end
  end
  
  resources :friends do
    collection do
      post "send_friend_request"
      post "cancel_friend_request"
      get "show_friend_request"
      post "accept_friend_request"
      post "reject_friend_request"
      get "friend"
    end
  end

  resources :posts

  resources :replies

  resources :albums do
    collection do
      post "add_tag"
      get "remove_tag" 
      get "show_tag"      
    end
      
    member do
       get "tag_image"   
    end
  end

  resources :chats do
    collection do
      get 'send_data'
    end
  end

  resources :locals

  resources :facebooks do
    collection do
      get "facebook_create"
      get "profile"
      get "wall"
      get "timeline"
      post "update_status"
      get "friends_list"
    end
  end

  devise_for :users, :controllers => { :registrations => "devise/registrations", :sessions => "devise/sessions",
     :confirmations => "devise/confirmations", :passwords => "devise/passwords", :unlocks => "devise/unlocks", 
     :omniauth_callbacks => "users/omniauth_callbacks" }
     
   devise_scope :user do 
     get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'    
   end   
  
  resources :comments
  
  get "home/index"

  #devise_for :users, :path => "usuarios", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' 
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
  root :to => "Home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
