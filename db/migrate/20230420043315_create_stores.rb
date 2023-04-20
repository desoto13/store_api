class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, index: { unique: true }, null: false
      t.string :url, null: false
      t.timestamps
    end
  end
end
