class RemoveColumnFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_index :events, :place_id
    remove_column :events, :place_id
  end
end
