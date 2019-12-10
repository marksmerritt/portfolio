Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :messages
  get "resume/show", as: :resume
end
