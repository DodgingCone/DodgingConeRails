Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'
  
  resources :scores
  
  devise_for :players

  namespace :api, defaults: { format: :json } do
    resources :scores
    
    mount_devise_token_auth_for 'Player', at: 'auth'
  end
end
