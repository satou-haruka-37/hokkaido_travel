class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  mount_uploaders :images, ImageUploader

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :seasons

  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  validates :title, presence: true, length: { maximum: 255 }
  validates :address, presence: true, uniqueness: true
  validates :body, length: { maximum: 300 }
  validates :images, length: { maximum: 3, message: 'は3枚までしかアップロードできません' }

  validate :validate_address
  validate :validate_hokkaido
  validate :must_have_tags

  def validate_address
    geocoded = Geocoder.search(address)
    return if geocoded&.first&.coordinates.present?

    errors.add(:address, 'が存在しません')
  end

  def validate_hokkaido
    unless address.include?("北海道")
      errors.add(:base, "北海道の住所を入力してください")
    end
  end

  def must_have_tags
    errors.add(:base, 'タグを1つ以上選択してください') unless tags.present?
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[title body] # 検索可能な属性を指定してください
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[tags user] # 検索可能な関連付けを指定してください
  end
end
