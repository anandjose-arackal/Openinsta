Rails.application.routes.draw do
  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'browse', to: 'posts#browse', as: :browse_posts
  root  'posts#index'
  resources :posts do
    resources :comments
  end
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile
  post ':user_name/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_name/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

end
