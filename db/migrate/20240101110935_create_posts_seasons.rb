class CreatePostsSeasons < ActiveRecord::Migration[7.0]
  def change
    create_table :posts_seasons do |t|
      t.references :post, foreign_key: true
      t.references :season, foreign_key: true
    end
  end
end
