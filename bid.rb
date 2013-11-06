require_relative 'participant'
require_relative 'auction'
require 'logger'

class Bid
    attr_accessor :auction, :bidder, :amount, :time
    
    def initialize(auction, bidder, amount)
        logger = Logger.new(STDOUT)
        
        if !auction.is_open?
            logger.warn 'Auction is closed, cannot bid!'
        elsif !auction.leading_bid.nil? && auction.leading_bid.amount >= amount
            logger.warn "Bid of #{amount} not high enough, must bid more than #{auction.leading_bid.amount}!"
        else
            @auction = auction
            @bidder = bidder
            @amount = amount
            @time = Time.new
            auction.leading_bid = self
            logger.info "Bid successful, leading amount is #{amount} from #{bidder.name}."
        end
    end
end