Rails.application.routes.draw do
  root "welcome#index"
  get "resume/show", as: :resume

  devise_for :users, skip: :registrations

  resources :messages

  resources :notebooks do 
    resources :notes, shallow: true

    member do 
      patch :toggle_status
    end
  end

  resources :notes, only: :index
end
