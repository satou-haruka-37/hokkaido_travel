class AddUniqueIndexToAddress < ActiveRecord::Migration[7.0]
  def change
    add_index :posts, :address, unique: true
  end
end
