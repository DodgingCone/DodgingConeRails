Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'

  devise_scope :player do 
    post 'custom_devise/sessions/create', defaults: { format: 'json' }
  end

  resources :scores

  devise_for :players
  
  namespace :api, defaults: { format: 'json' } do
    resources :scores
  end
end
