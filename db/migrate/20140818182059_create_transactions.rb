class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :type_of_transaction
      t.string :concept
      t.string :commentary
      t.date :date
      t.timestamps
    end
  end
end
