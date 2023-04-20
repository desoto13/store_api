class RenameUpdatedAtInProductTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :updated_at, :inventory_updated_time
  end
end
