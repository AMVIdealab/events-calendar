class RenameColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :title, :name
  end
end
