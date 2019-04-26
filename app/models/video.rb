class Video < ApplicationRecord
  require 'net/http'
  require 'uri'

  # タグ関連
  acts_as_taggable

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :video_genres, dependent: :destroy
  has_many :genres, through: :video_genres, source: :genre
  has_many :comments, dependent: :destroy

  validates :title, :content, :url, presence: true
  validates :title, :url, length: { maximum: 100 }
  validates :content, length: { maximum: 300 }
  validate :video_exist?

  scope :sort_like, -> { order(likes_count: :desc) }
  scope :sort_created_at, -> { order(created_at: :desc) }
  scope :sort_genre, ->(genre_id) { where(id: genre_ids = VideoGenre.where(genre_id: genre_id).select(:video_id)) }

  private

  def video_exist?
    if /\Ahttps?:\/\/(?:www\.)?youtube.com\/watch\?(?=.*v=\w+)(?:\S+)?\z/ === url
      uri = URI.parse(url)
      request = Net::HTTP::Head.new(uri)

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      if response.code != "200"
        errors.add(:url, "このurlは存在しないか削除されています")
      end
    else
      errors.add(:url)
    end
  end
end
