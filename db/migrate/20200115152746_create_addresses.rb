class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street_address
      t.string :zip_code
      t.string :state
      t.string :nation
      t.belongs_to :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
