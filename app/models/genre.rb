class Genre < ApplicationRecord
  has_many :video_genres, dependent: :destroy
  has_many :videos, through: :video_genres, source: :video
end
