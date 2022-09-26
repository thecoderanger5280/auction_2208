require 'rspec'
require './lib/item'
require './lib/auction'

RSpec.describe Auction do
  describe '#initialize' do
    it 'exists' do
      auction = Auction.new

      expect(auction).to be_an_instance_of(Auction)
    end

    it 'has no items to start' do
      auction = Auction.new

      expect(auction.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'can add items' do
      auction = Auction.new
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')

      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.items).to eq([item1, item2])
    end
  end
end