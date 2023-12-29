class User < ApplicationRecord
  enum role: { normal: 0, admin: 1 }

  has_many :posts, dependent: :destroy

  validates :uid, presence: true, uniqueness: true
  validates :name, presence: true

  def self.find_or_create_from_auth(auth)
    uid = auth[:uid]
    user = find_or_initialize_by(uid:) # UIDでユーザーを検索または新規作成（まだ保存されていない）
    user.name = auth[:info][:name] if user.new_record?# Auth0からの情報をユーザーに追加
    user.save if user.changed? # 変更がある場合のみ保存
    user
  end
end
