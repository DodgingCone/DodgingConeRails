Rails.application.routes.draw do
  devise_for :players
  root 'welcome#index'

  get 'welcome/index'
end
