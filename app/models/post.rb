class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }
  validates :address, presence: true
  validates :body, length: { maximum: 65_535 }
  validate :validate_address

  def validate_address
    geocoded = Geocoder.search(address)
    unless geocoded&.first&.coordinates.present?
      errors.add(:address, 'が存在しません')
    end
  end

end
