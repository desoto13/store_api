require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:new_store) { Store.create(name: "sari-sari", url: "https://sari-sari.com") }
  subject { new_store.products.new(name: "ice candy", sku: "RF243F", inventory_quantity: 20) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:store_id) }
    it { should validate_presence_of(:sku) }
    it { should validate_presence_of(:inventory_quantity) }
  end

  describe 'associations' do
    it { should belong_to(:store) }
  end

  let(:product1) { new_store.products.new(name: "ice cream", sku: "RF244F", inventory_quantity: 20) }

  describe '#Creation, Updating and Deletion of products' do
    it 'should successfully create a new valid store' do
      expect(product1.save).to be_truthy
    end

    it 'should be successfully updated' do
      product1.save
      product1.update(inventory_quantity: 100)
      expect(product1.inventory_quantity).to eq(100)
      expect(product1.inventory_updated_time).to eq(product1.updated_at)
    end

    it 'should be successfully deleted' do
      product1.save
      product1.destroy
      expect(Product.find_by(name: 'ice cream')).to eq(nil)
    end
  end
end
