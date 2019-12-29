class AddPlaceIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :place_id, :integer
  end
end
