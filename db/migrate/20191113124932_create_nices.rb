class CreateNices < ActiveRecord::Migration[5.2]
  def change
    create_table :nices do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
