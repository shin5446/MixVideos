Rails.application.routes.draw do
  root 'videos#index'
  # ユーザー関連
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show]
  # 動画関連
  resources :videos
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end