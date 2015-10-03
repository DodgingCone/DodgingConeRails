Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'

  # See and edit my profile
  get 'profiles/edit'
  get 'profiles/:id', to: 'profiles#show', as: 'profile'
  patch 'profiles/update'

  resources :scores, defaults: { format: 'html' } do
    resources :comments, shallow: true
  end
  
  devise_for :players

  namespace :api, defaults: { format: :json } do
    resources :scores
    
    mount_devise_token_auth_for 'Player', at: 'auth'
  end
end
