Artistnxt::Application.routes.draw do
  
  get "fanregister" => 'pages#fanregister', as: :fanregister
  get "admin/videos"
  get "/admin/video_details/:cid/" => 'admin#video_details', as: :admin_video_details
  match "/admin/save_video" => 'admin#save_video', via: [:post], as: :admin_save_video
  match "/admin/removevideo/:cid/" => "admin#removevideo", as: :removevideo, via: [:delete]
  get "admin/music"
  get "/admin/music_details/:cid/" => 'admin#music_details', as: :admin_music_details
  match "/admin/removemusic/:cid/" => "admin#removemusic", as: :removemusic, via: [:delete]
  
  get '/news/:id' => 'pages#readnews', as: :read_admin_news
  match '/news/save_ordering' => 'admin_news#save_ordering', via: [:post]
  resources :admin_news

  match '/cart/confirm' => 'carts#confirm', via: [:post]
  match '/confirm_music_purchase' => 'payment_notifications#confirm_music_purchase', via: [:post]
  get '/cart/checkout' => 'carts#checkout'
  match '/cart/remove_item' => 'carts#remove_item', via: [:delete]
  
  resources :order_items

  resources :orders

  resources :cart_items

  resources :carts

  get '/page/:alias' => 'pages#content_page', as: :content_page
  
  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  
  match "payment/notifications" => 'payment_notifications#create', via: [:post]
  get "admin/settings"
  match "admin/save_settings" => 'admin#save_settings', via: [:post]  
  match "/admin/save_user" => 'admin#save_user', via: [:post], as: :admin_save_user
  match "/admin/save_new_user" => 'admin#save_new_user', via: [:post], as: :admin_save_new_user
  get "admin/dashboard"
  get "admin/users"
  get "admin/artists"
  get "admin/artist"
  get "admin/new_user"
  get "admin/edit_user"
  get "admin/fan"
  get "admin/fans"
  get "admin/users_json"
  get "admin/slides"
  get "profile/index"
  #get "profile/upload_image"
  get "profile/follower_fans"
  get "profile/artist_following"
  #get "profile/settings"
  
  match '/slides/save_ordering' => 'slides#save_ordering', via: [:post]
  match '/music_categories/save_ordering' => 'music_categories#save_ordering', via: [:post]
  match '/plans/save_ordering' => 'plans#save_ordering', via: [:post]
  match '/subscriptions/clear_invoice' => 'subscriptions#clear_invoice',via: [:get],  as: :clear_invoice
  #match '/subscriptions/set_expiration_date' => 'subscriptions#set_expiration_date',via: [:post]
  #match '/subscriptions/set_subscription_status' => 'subscriptions#set_subscription_status',via: [:post]
  match '/subscriptions/update' => 'subscriptions#update',via: [:post]
  match '/music_purchases/complete_order/:id' => 'music_purchases#complete_order',via: [:get], as: :admin_music_purchase_complete
  
  match '/application/upload_photo' => 'application#upload_photo', via: [:post]
  match '/application/check_email' => 'application#check_email', via: [:get]
  
  get '/artist/:id' => 'pages#dashboard', as: :artist_dashboard
  get '/fan/:id' => 'pages#dashboard', as: :fan_dashboard
  get '/dashboard/:id' => 'pages#dashboard', as: :user_dashboard
  get '/become_fan/:artistid/:fanid' => 'pages#become_fan', as: :become_fan
  get '/add_friend/:sender_id/:receiver_id' => 'profile#add_friend', as: :add_friend
  get '/remove_friend/:sender_id/:receiver_id' => 'profile#remove_friend', as: :remove_friend
  get '/accept_friend_request/:sender_id/:receiver_id' => 'profile#accept_friend_request', as: :accept_friend_request
  get '/my_friends' => 'profile#my_friends', as: :my_friends
  get '/peding_friend_requests' => 'profile#peding_friend_requests', as: :peding_friend_requests
  get '/awaiting_friend_requests' => 'profile#awaiting_friend_requests', as: :awaiting_friend_requests
  get '/artist_fantistics/:artist_id' => 'pages#artist_fantistics', as: :artist_fantistics
  
  get '/countries/get_states' => 'countries#get_country_states'
  
  get '/video/watch/:id' => 'videos#watch', as: :watch_video
  get '/video/remove_watch/:user_id/:id' => 'videos#remove_watch', as: :remove_video_watch
  get '/video/clear_watch_list' => 'videos#clear_watch_list', as: :clear_watch_list
  get '/video/make_favorite/:user_id/:id' => 'videos#make_favorite', as: :make_video_favorite
  get '/video/remove_favorite/:user_id/:id' => 'videos#remove_favorite', as: :remove_video_favorite
  get '/news/read/:id' => 'news#read', as: :read_news
  get '/event/details/:id' => 'events#details', as: :event_details
  
  get '/admin/make_featured_artist/:artist_id/:value' => 'admin#make_featured_artist', as: :make_featured_artist
  get '/admin/removeuser/:user_id/' => 'admin#removeuser', as: :removeuser
  
  get '/renew_subscription/:subscription_id' => 'pages#renew_subscription', as: :renew_subscription
  get '/confirmation_subscription/:subscription_id/:plan_id' => 'pages#confirmation_subscription', as: :confirmation_subscription
  get '/subscription_confirmed/:subscription_id/:plan_id' => 'pages#subscription_confirmed', as: :subscription_confirmed
  get '/pending_invoice/:subscription_id' => 'pages#pending_invoice', as: :pending_invoice
  get '/confirm_pending_invoice/:subscription_id' => 'pages#confirm_pending_invoice', as: :confirm_pending_invoice
  get '/download_music/:unqiue_key' => 'pages#download_music', as: :download_music
  get '/download_free_music/:id' => 'pages#download_free_music', as: :download_free_music
  get '/my_musics' => 'profile#my_musics', as: :my_musics
  get '/my_purchases' => 'profile#my_purchases', as: :my_purchases
  get '/my_music_sales' => 'profile#my_music_sales', as: :my_music_sales
  get '/favorite_videos' => 'profile#favorite_videos', as: :favorite_videos
  get '/watch_history' => 'profile#watch_history', as: :watch_history
  
  get '/my_order_details/:id' => 'profile#my_order_details',via: [:get], as: :my_order_details
  get '/pay_my_order/:id' => 'profile#pay_my_order',via: [:get], as: :pay_my_order
  
  match '/make_comment' => 'comments#create', via: [:post]
  
  resources :states

  resources :countries

  scope "/admin" do
    resources :contents
    resources :music_categories
    resources :music_purchases
    resources :plans
    resources :slides
    resources :subscriptions
  end

  devise_for :users, :controllers => { :registrations  => "users/registrations", :sessions => "users/sessions", :omniauth_callbacks => "users/omniauth_callbacks", :confirmations  => "users/confirmations" }
  
  devise_scope :user do
    get 'users' => 'devise/sessions#new'
    get 'signup/artist' => 'users/registrations#new', :user => { :user_type => 'artist' }
    get 'signup/fan' => 'users/registrations#new', :user => { :user_type => 'fan' }
    
    #match 'users/omniauth_callbacks' => 'users/omniauth_callbacks#facebook', via: [:post]
    match 'users/omniauth_callbacks_confirm' => 'users/omniauth_callbacks#confirm_user_provider_signup', via: [:post]
  end
  
  resources :users do
    resources :videos, :audios, :news, :events
  end
  
  get "genres" => 'pages#genres'
  get "signup" => 'pages#signup'
  
  root 'pages#home'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
