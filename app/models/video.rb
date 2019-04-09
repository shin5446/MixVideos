class Video < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
