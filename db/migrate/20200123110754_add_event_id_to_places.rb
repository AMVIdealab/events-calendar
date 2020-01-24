class AddEventIdToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :event_id, :integer, foreign_key: true
    add_index :places, :event_id
  end
end
