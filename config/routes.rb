Rails.application.routes.draw do
  get 'tags/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'videos#index'

  # ユーザー関連
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: %i[show index]

  # 動画関連
  resources :videos do
    # 動画に対するコメント関連
    resources :comments
  end

  # いいね関連
  resources :likes, only: %i[show create destroy]

  # フォローフォロワー関連
  resources :relationships, only: %i[show create destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end