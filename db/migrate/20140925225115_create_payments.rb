class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :date
      t.decimal :quantity, precision: 10, scale: 2
      t.integer :client_id
      t.string :concept
      t.text :notes
      t.timestamps
    end
  end
end
