class AddUserIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, foreign_key: true
  end
end
