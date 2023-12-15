class CreatePostsTags < ActiveRecord::Migration[7.0]
  def change
    create_table :posts_tags do |t|
      t.references :post, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end