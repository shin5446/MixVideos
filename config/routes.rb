Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'videos#index'

  # ユーザー関連
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: %i[show index]

  # TOPページ
  resources :toppages, only: %i[index]

  # 動画関連
  resources :videos do
  # 動画に対するコメント関連
    resources :comments
  end

  # いいね関連
  resources :likes, only: %i[create destroy]

  # フォローフォロワー関連
  resources :relationships, only: %i[show create destroy]

  # タグ関連
  resources :tags, only: %i[index]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end