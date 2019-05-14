class Service < ApplicationRecord
  has_many :videos, dependent: :destroy

  validates :name, presence: true
end
