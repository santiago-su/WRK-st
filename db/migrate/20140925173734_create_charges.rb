class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.date :date
      t.integer :client_id
      t.decimal :quantity, precision: 14, scale: 2
      t.string :concept
      t.text :notes
      t.timestamps
    end
    add_index :charges, :client_id
  end
end
