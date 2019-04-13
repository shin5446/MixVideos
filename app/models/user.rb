class User < ApplicationRecord
  has_many :videos
  has_many :likes, dependent: :destroy
  has_many :like_videos, through: :likes, source: :video
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
