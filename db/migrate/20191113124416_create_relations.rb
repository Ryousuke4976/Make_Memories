class CreateRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.references :user_id, foreign_key: true
      t.references :follow_id, foreign_key: { to_table: :users }

      t.timestamps

      t.index [:user_id, :follow_id], unique: true
    end
  end
end
