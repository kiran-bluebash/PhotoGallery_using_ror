Rails.application.routes.draw do
  devise_for :users  
  # devise_scope :user do
  #   delete "/users/sign_out", to: "devise/sessions#destroy"
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "albums#index"
  get '/my_albums' ,to: 'albums#my_albums'
  get 'tags/:tag', to: 'albums#index', as: :tag



  resources :albums do
    member do
      delete :remove_image
    end
  end
 # delete "/albums/:id/images/:id" ,to: "images#remove_image"
  # Defines the root path route ("/")
  # root "articles#index"
end
