class Service < ApplicationRecord
  has_many :videos, dependent: :destroy
end
