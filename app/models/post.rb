class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  has_and_belongs_to_many :tags

  validates :title, presence: true, length: { maximum: 255 }
  validates :address, presence: true
  validates :body, length: { maximum: 65_535 }
  validate :validate_address
  validate :must_have_tags

  def validate_address
    geocoded = Geocoder.search(address)
    unless geocoded&.first&.coordinates.present?
      errors.add(:address, 'が存在しません')
    end
  end

  def must_have_tags
    errors.add(:base, '少なくとも1つのタグを選択してください') unless tags.present?
  end

end
