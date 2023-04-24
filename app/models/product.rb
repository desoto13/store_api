class Product < ApplicationRecord
  belongs_to :store
  validates :name, uniqueness: { scope: :store_id }
  validates :name, :sku, :inventory_quantity, presence: true

  before_update :check_for_inventory_change

  def check_for_inventory_change
    if will_save_change_to_inventory_quantity?
      self.inventory_updated_time = self.updated_at
    end
  end
end
