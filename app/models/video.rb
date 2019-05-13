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

  # ユーザーがいいねをしているか判定
  def like?(video, user)
    video.likes.find_by(user_id: user.id)
  end

  private

  # 不正なURLを弾くために独自のバリデーションを実装
  def video_exist?
    url.gsub!('https://youtu.be/', 'https://www.youtube.com/watch?v=') if %r{https?://?youtu.be}.match?(url)
    url.gsub!(/https?:\/\/nico.ms/, 'https://www.nicovideo.jp/watch') if %r{https?://?nico.ms}.match?(url)
    url.gsub!('https://dai.ly', 'https://www.dailymotion.com/video') if %r{https?://?dai.ly}.match?(url)
    url.gsub!('https://dai.ly', 'https://www.dailymotion.com/video') if %r{https?://?dai.ly}.match?(url)

    if %r{\Ahttps?://(?:www\.)?youtube.com/watch\?(?=.*v=\w+)(?:\S+)?\z}.match?(url) ||
       %r{https?://?www.nicovideo.jp/watch}.match?(url) ||
       %r{https?://?www.dailymotion.com/video}.match?(url) ||
       %r{https?://?www.pandora.tv/view}.match?(url)

      uri = URI.parse(url)
      request = Net::HTTP::Head.new(uri)

      req_options = {
        use_ssl: uri.scheme == 'https'
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      errors.add(:url, 'このurlは存在しないか削除されています') unless response.code == '302' || response.code == '200'
    else
      errors.add(:url)
    end
  end
end
