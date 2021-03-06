Rails.application.routes.draw do
  match 'workshops/pending', to: "workshops#pending", via: [:get]
  match 'workshops/pending/:id', to: "workshops#approve", via: [:get]
  match "users/profile/:id", to: "user#profile", via: [:get]
  match 'workshops/:id/rsvp', to: "rsvp#create", via: [:get]
  match 'workshops/:id/cancel_rsvp', to: "rsvp#destroy", via: [:get]
  get 'api/locations'

  get 'api/workshops'

  get 'api/map'

  get 'api/sign_up'

  get 'admin/index'
  get 'admin/locations'
  get 'admin/workshops'

  get 'static_pages/about'
  get 'static_pages/sign_up'

  match "create_user", to: "admin#create_user", via: [:get, :post]
  get 'workshops/calendar' => 'workshops#calendar'

  resources :workshops
  get 'locations/map' => 'locations#map'
  resources :locations
  resources :followers
  devise_for :users
  root 'static_pages#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
