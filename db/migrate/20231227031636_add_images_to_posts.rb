class AddImagesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :images, :json
  end
end
