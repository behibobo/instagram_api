Rails.application.routes.draw do
  resources :posts
  post 'upload_avatar', to: "uploader#create_avatar"
  post 'upload_image', to: "uploader#upload_post_image"
  post 'auth/login', to: 'auth#login'
  post 'auth/signup', to: 'auth#signup'
  get 'dashboard', to: 'dashboard#index'
end
