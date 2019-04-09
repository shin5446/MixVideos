Rails.application.routes.draw do
  get 'users/show'
  resources :users, only: [:show]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'videos#index'
  resources :videos
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end