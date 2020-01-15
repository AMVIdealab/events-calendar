class AddIndexToEvents < ActiveRecord::Migration[6.0]
  def change
    add_index :events, :place_id
  end
end
