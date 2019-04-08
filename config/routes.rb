Rails.application.routes.draw do
  devise_for :users
  root 'videos#index'
  resources :videos
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end