class AddChargeIdToServices < ActiveRecord::Migration
  def change
    add_column :services, :charge_id, :integer
    add_index :services, :charge_id
  end
end
