class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 14, scale: 2
      t.string :type_of_transaction
      t.string :concept
      t.text :notes
      t.date :date
      t.timestamps
    end
  end
end
