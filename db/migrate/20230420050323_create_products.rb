class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.belongs_to :store
      t.string :name, index: { unique: true }, null: false
      t.string :sku, index: { unique: true }, null: false
      t.integer :inventory_quantity, null: false
      t.timestamps
    end
  end
end
