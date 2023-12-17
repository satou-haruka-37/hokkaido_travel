class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :uid, null: false, unique: true
      t.string :name
      t.integer :role, null: false, default: 0

      t.timestamps
    end
  end
end
