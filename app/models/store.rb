class Store < ApplicationRecord
  has_many :products
  validates :name, :url, uniqueness: true, presence: true
end
