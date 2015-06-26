Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  root to: 'welcome#index'

  get 'my-counters', to: 'buttons#personal'
  resources :buttons
end
