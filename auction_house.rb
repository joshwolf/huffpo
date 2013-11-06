require 'securerandom'
require 'logger'

class AuctionHouse
    @@logger = Logger.new(STDOUT)
    attr_accessor :auctions
    
    def initialize
        @auctions = Hash.new
    end
    
    def has_failed_auction(this_item)
        existing_auctions = @auctions.values.select{|x| x.item == this_item && x.has_failed}.any?
    end
    
    def add_auction(item,reserve_price)
        if self.has_failed_auction(item)
            @@logger.error 'Cannot add auction, this item already failed a previous auction'
        else
            auction_id = SecureRandom.uuid
            auction = Auction.new(item,reserve_price)
            @auctions[auction_id] = auction
            @@logger.info "Auction for #{item.name} created, reserve price is #{reserve_price}"
            auction
        end
    end
    
    def most_recent_auction(name)
        @auctions.values.select{|x| x.item.name == name}.last
    end
    
    def most_recent_auction_info(name)
        latest_auction = most_recent_auction(name)
        if latest_auction.nil?
            statuts = "No #{name} auctions found!"
        else
            status = "Latest auction for #{name}: Auction is #{latest_auction.status}. "
            if latest_auction.is_open? then status += "Current leading " else status += "Winning " end
            status += "bid is #{latest_auction.leading_bid.amount} from #{latest_auction.leading_bid.bidder.name}."
            if latest_auction.has_failed? then status += " AUCTION HAS FAILED!" end
        end
        status
    end
end