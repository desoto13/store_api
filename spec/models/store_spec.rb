require 'rails_helper'

RSpec.describe Store, type: :model do
  subject { Store.new(name: "sari-sari", url: "https://sari-sari.com") }
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
  end

  describe 'associations' do
    it { should have_many(:products) }
  end

  let(:convenience_store) { Store.new(name: "convenience", url: "https://convenience-store.com") }

  describe '#Creation, Updating and Deletion of store' do
    it 'should successfully create a new valid store' do
      expect(convenience_store.save).to be_truthy
    end

    it 'should be successfully updated' do
      convenience_store.save
      convenience_store.update(name: 'grocery')
      expect(convenience_store.name).to eq('grocery')
    end

    it 'should be successfully deleted' do
      convenience_store.save
      convenience_store.destroy
      expect(Store.find_by(name: 'convenience')).to eq(nil)
    end
  end

end
