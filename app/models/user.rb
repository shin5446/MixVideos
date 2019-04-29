class User < ApplicationRecord
  has_many :videos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_videos, through: :likes, source: :video
  has_many :comments, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: { maximum: 30 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[google]
  # 画像アップ用の設定
  mount_uploader :icon, ImageUploader

  # 指定のユーザをフォローする
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  # フォローしているかどうかを確認する
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  # 指定のユーザのフォローを解除する
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # oauth認証
  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    user ||= User.new(
      email: auth.info.email,
      provider: auth.provider,
      uid: auth.uid,
      name: auth.info.name,
      password: Devise.friendly_token[0, 20]
    )
    user.save
    user
  end

  # ランダムなuidを作成
  def self.create_unique_string
    SecureRandom.uuid
  end

  # パスワード無しでアカウントを編集
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
