class Item
  attr_reader :name,
              :bids
  def initialize(name)
    @name = name
    @bids = {}
    @biddable = true
  end

  def add_bid(attendee, bid)
    if(@biddable)
      @bids[attendee] = bid
    end
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @biddable = false
  end
end