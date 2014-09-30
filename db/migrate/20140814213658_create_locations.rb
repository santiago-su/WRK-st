class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.integer :client_id
      t.decimal :amount, precision: 14, scale: 2
      t.timestamps
    end
    add_index :locations, :client_id
  end
end
