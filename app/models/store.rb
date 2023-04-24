class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, :url, uniqueness: true, presence: true
end
