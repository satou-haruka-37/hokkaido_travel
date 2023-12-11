class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
end
