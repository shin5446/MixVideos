class Genre < ApplicationRecord
  has_many :genre_videos, dependent: :destroy
  has_many :videos, through: :genre_videos, source: :video
end
