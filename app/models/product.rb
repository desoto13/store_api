class Product < ApplicationRecord
  belongs_to :store
  validates :name, uniqueness: { scope: :store_id }

  self.ignored_columns = %w[updated_at]
  self.attribute :inventory_updated_time, :datetime
end
