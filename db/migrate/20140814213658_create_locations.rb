class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string "name"
      t.string "description"
      t.integer "client_id"
      t.timestamps
    end
    add_index :locations, :client_id
  end
end
