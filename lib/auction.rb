class Auction
  attr_reader :items

  def initialize
    @items = []
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
    bid_items.map do |item|
      item.bids.values.max
    end.sum
  end

  def bidders
    bid_items = @items.find_all { |item| item.bids != {}}
    bidders = bid_items.map do |item|
      item.bids.keys
    end
    bidders.flatten.uniq.map(&:name)
  end

  def bidder_info
    info = {}
    bid_items = @items.find_all { |item| item.bids != {}}
    bidders = bid_items.map do |item|
      item.bids.keys
    end
    bidders.flatten.uniq.each do |bidder|
      # require 'pry'; binding.pry
      info[bidder] = {budget: bidder.budget, items: bid_items.find_all { |item| item.bids.keys.include?(bidder)}}
    end
    info
  end
end