class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :places, :nname, :name
  end
end
