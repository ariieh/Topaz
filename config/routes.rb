Rails.application.routes.draw do
  get "favorites" => "static_pages#empty", as: :static_pages_empty
  get "welcome" => "static_pages#welcome", as: :static_pages_welcome
  get "about" => "static_pages#about", as: :static_pages_about
  
  get "notifications/:id" => "notifications#url_path", as: :notifications
  get "/auth/facebook/callback", to: "sessions#facebook_login"
  get "/api/articles/favorites" => "api/articles#favorites", as: :favorites
  get "/api/articles/tag/:name" => "api/articles#tagshow", as: :tag
  
  root "articles#backbone"
  
  shallow do
    resources :users do
      resources :articles, only: [:index]
    end
  end
  
  resources :articles, shallow: true do
    resources :comments
    resources :tags
    resources :votes
  end
  
  resources :votes, only: [:index, :create]
  resources :comments, only: [:create]
  resources :tags, only: [:create]
  resource :session
  
  namespace :api, defaults: { format: :json } do
    
    shallow do
      resources :users do
        resources :articles, only: [:index]
      end
    end
  
    resources :articles, shallow: true do
      resources :comments
      resources :tags
      resources :votes
    end
  
    resources :votes, only: [:index, :create]
    resources :comments
    resources :notifications
    resources :tags, only: [:create]
    resource :session
  end

  
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
