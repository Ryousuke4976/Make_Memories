class ChangeColumnNamesOnRelations < ActiveRecord::Migration[5.2]
  def change
    rename_column :relations, :user_id_id, :user_id
    rename_column :relations, :follow_id_id, :follow_id
  end
end
