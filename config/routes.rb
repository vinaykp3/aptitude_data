Interview::Application.routes.draw do

  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #match '/show', to: 'scores#show', via: 'get'

  resources :questions do
   get "student_answer",:on=>:collection
   get "student_individual_answer",:on=>:collection
   get "excel_generate",:on=>:collection
   get "student_result",:on=>:collection
   get "fetch_topic_for_questions",:on=>:collection
   get "select_topic",:on=>:collection
   get "dashboard",:on=>:collection
  end

  resources :scores ,:except => [:show,:destroy,:edit,:update] do
    get "test_saved",:on => :collection
    get "display",:on => :collection
  end

  resources :students

  resources :topics do
    get "fetch_topic",:on => :collection
  end

    root "students#index"

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
