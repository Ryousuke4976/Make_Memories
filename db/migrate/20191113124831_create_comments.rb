class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.string :comment, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
