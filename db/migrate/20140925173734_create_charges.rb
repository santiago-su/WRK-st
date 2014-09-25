class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.date :date
      t.integer :client_id
      t.integer :quantity
      t.string :concept
      t.text :notes
      t.timestamps
    end
  end
end
