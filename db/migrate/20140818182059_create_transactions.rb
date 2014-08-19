class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :type_of_transaction
      t.string :concept
      t.string :commentary
      t.timestamps
      t.string :date
    end
  end
end
