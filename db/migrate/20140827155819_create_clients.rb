class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :responsible
      t.string :email
      t.string :description
      t.string :phone
      t.integer :meeting_office_hours
      t.date :entry_date
      t.integer :location_id
      t.timestamps
    end
    add_index :clients, :location_id
  end
end
