class AddPaymentIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :payment_id, :integer
    add_index :transactions, :payment_id
  end
end
