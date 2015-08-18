Rails.application.routes.draw do
  resources :scores
  get 'welcome/index'
  
  devise_for :players
  root 'welcome#index'
end
