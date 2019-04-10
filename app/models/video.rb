class Video < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :genre_subscs, dependent: :destroy
  has_many :genres, through: :genre_videos, source: :genre
end
