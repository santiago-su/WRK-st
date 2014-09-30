class RenameLocationsTable < ActiveRecord::Migration
  def change
    rename_table :locations, :services
  end
end
