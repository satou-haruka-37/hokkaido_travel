class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, uniqueness: { scope: :post_id } # 1つの投稿に同じユーザーが重複してブックマークできないようにしている
end
