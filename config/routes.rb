Rails.application.routes.draw do
  root "welcome#index"
  get "resume/show", as: :resume

  devise_for :users, skip: :registrations

  resources :messages
  resources :notebooks
end
