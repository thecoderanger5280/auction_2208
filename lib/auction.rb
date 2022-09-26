require 'Time'

class Auction
  attr_reader :items,
              :date

  def initialize
    @items = []
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map(&:name)
  end

  def unpopular_items
    @items.find_all { |item| item.bids == {}}
  end

  def potential_revenue
    bid_items = @items.find_all { |item| item.bids != {}}
    bid_items.map { |item| item.bids.values.max}.sum
  end

  def bidders
    bid_items = @items.find_all { |item| item.bids != {}}
    bidders = bid_items.map { |item| item.bids.keys}
    bidders.flatten.uniq.map(&:name)
  end

  def bidder_info
    info = {}
    bid_items = @items.find_all { |item| item.bids != {}}
    bidders = bid_items.map { |item| item.bids.keys}
    bidders.flatten.uniq.each do |bidder|
      info[bidder] = {
        budget: bidder.budget, items: bid_items.find_all { |item| item.bids.keys.include?(bidder)}}
    end
    info
  end

  def close_auction
    auction_info = {}
    max_bidder = @items.map do |item|
      item.bids.key(item.bids.values.max)
      # require 'pry'; binding.pry
    end
    @items.each_with_index do |item, i|
      if(max_bidder[i] != nil)
        auction_info[item] = max_bidder[i]
      else
        auction_info[item] = 'Not Sold'
      end
    end
    auction_info
    # require 'pry'; binding.pry
  end
end