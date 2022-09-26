require 'rspec'
require './lib/item'
require './lib/attendee'

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

  describe '#add_bid' do
    it 'can add a bid' do
      item1 = Item.new('Chalkware Piggy Bank')
      attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      attendee2 = Attendee.new({name: 'Bob', budget: '$75'})

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      expect(item.bids).to eq({attendee2 => 20, attendee1 => 22})
    end
  end
end