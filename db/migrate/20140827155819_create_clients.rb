class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :responsible
      t.string :email
      t.string :location
      t.string :description
      t.integer :phone
      t.integer :meeting_office_hours
      t.string :entry_date
      t.timestamps
    end
  end
end
