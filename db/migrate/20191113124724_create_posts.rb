class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.text :content, null: false
      t.text :image_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
