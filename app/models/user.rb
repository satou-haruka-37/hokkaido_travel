class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  enum role: { normal: 0, admin: 1 }

  has_many :posts
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarks_posts, through: :bookmarks, source: :post

  validates :uid, presence: true, uniqueness: true
  validates :name, presence: true

  def self.find_or_create_from_auth(auth)
    uid = auth[:uid]
    user = find_or_initialize_by(uid:) # UIDでユーザーを検索または新規作成（まだ保存されていない）
    user.name = auth[:info][:name] if user.new_record?# Auth0からの情報をユーザーに追加
    user.save if user.changed? # 変更がある場合のみ保存
    user
  end

  # ブックマーク機能のメソッド
  def bookmark(post)
    bookmarks_posts << post unless bookmarks_posts.include?(post)
  end

  def bookmark_destroy(post)
    bookmarks_posts.destroy(post)
  end

  def bookmark?(post)
    bookmarks_posts.include?(post)
  end

  # 管理者権限を持つか判定
  def admin?
    self.role == 'admin'
  end

end
