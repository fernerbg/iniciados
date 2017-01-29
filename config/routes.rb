Rails.application.routes.draw do

  resources :books do
    member do
      get 'show_page'
      get 'send_page'
    end
  end

  resources :notifications, only: :index

  resources :audios, only: :index do
    member do
      get 'send_wave'
      get 'stream'
    end
  end

  resources :tags

  resources :level_contents

  resources :lesson_contents

  resources :contents do
    collection do
      get 'send_content'
    end
  end

  resources :levels

  resources :lessons
  
  resources :lesson_levels

  resources :roles

  resources :profiles

  devise_for :users, controllers: { sessions: "users/sessions" }

  resources :users do
    collection do
      get 'get_cognito_token'
    end
  end

  get 'home', to: "users#home"
  
  namespace :adm do
    resource :contents, only: [ :index ] do
      collection do
        get 'users_csv'
        post 'upload_users_csv'
      end
    end
    
    resource :audios
    
    resources :notifications
    
    resources :books do
      member do
        post 'create_page'
        get 'new_page'
      end
      resources :sections, shallow: true do
        resources :chapters, shallow: true
      end
    end
  end

  namespace :coor do
    resources :users do
      member do
        get 'pass_next_level'
        get 'pass_next_lesson'
      end
    end
  end
  
  #get "/private/content/open/file/:id/:title.:ext", to: "contents#delivery", as: "delivery"

  root 'users#home'

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
