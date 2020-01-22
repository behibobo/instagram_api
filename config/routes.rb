Rails.application.routes.draw do
  resources :posts
  post 'upload_avatar', to: "uploader#create_avatar"
  post 'upload_image', to: "uploader#upload_post_image"
  post 'auth/login', to: 'auth#login'
  post 'auth/signup', to: 'auth#signup'
  get 'me', to: 'auth#me'
  put 'auth/update', to: 'auth#update'
  put 'auth/update_password', to: 'auth#update_password'
  get 'dashboard', to: 'dashboard#index'
  get 'my_posts', to: 'posts#my_posts'
  get 'posts/:id/like', to: 'posts#like'
end
