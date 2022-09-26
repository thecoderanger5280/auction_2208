require 'rspec'
require './lib/item'

RSpec.describe Item do
  describe '#initialize' do
    it 'exists' do
      item1 = Item.new('Chalkware Piggy Bank')

      expect(item1).to be_an_instance_of(Item)
    end

    it 'has no bidds to start' do
      item1 = Item.new('Chalkware Piggy Bank')

      expect(item1.bids).to eq({})
    end

    it 'has a name' do
      item1 = Item.new('Chalkware Piggy Bank')

      expect(item1.name).to eq('Chalkware Piggy Bank')
    end
  end
end