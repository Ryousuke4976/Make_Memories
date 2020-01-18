class CreatePostGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :post_genres do |t|
      t.integer :post_id, null: false
      t.integer :genre_id, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
