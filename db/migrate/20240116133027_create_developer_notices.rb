class CreateDeveloperNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :developer_notices do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
