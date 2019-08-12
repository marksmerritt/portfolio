Rails.application.routes.draw do
  root 'welcome#index'
  resources :messages
  get "resume/show", as: :resume
end
