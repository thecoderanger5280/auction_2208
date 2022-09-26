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
end