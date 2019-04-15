class Video < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :video_genres, dependent: :destroy
  has_many :genres, through: :video_genres, source: :genre
  has_many :comments, dependent: :destroy

  validates :title, :content, :url, presence: true
  validates :title, length: { maximum: 30 }
  validates :content, length: { maximum: 300 }
  validates :url, format: /\A#{URI.regexp(%w[http https])}\z/, length: { maximum: 100 }
end
