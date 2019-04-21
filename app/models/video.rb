class Video < ApplicationRecord
  # タグ関連
  acts_as_taggable

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :video_genres, dependent: :destroy
  has_many :genres, through: :video_genres, source: :genre
  has_many :comments, dependent: :destroy

  validates :title, :content, :url, presence: true
  validates :title, length: { maximum: 50 }
  validates :content, length: { maximum: 300 }
  validates :url, format: /\Ahttps?:\/\/(?:www\.)?youtube.com\/watch\?(?=.*v=\w+)(?:\S+)?\z/, length: { maximum: 100 }

  scope :sort_like, -> { order(likes_count: :desc) }
  scope :sort_created_at, -> { order(created_at: :desc) }
  scope :sort_genre, ->(genre_id) { where(id: genre_ids = VideoGenre.where(genre_id: genre_id).select(:video_id)) }
end
