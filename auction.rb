require 'securerandom'
require_relative 'item'
require 'logger'

class Auction    
    @@logger = Logger.new(STDOUT)

    attr_accessor :id, :item, :reserve_price, :is_open, :leading_bid, :has_failed
    
    def initialize(item, reserve_price)
        @id = SecureRandom.uuid
        @item = item
        @reserve_price = Integer(reserve_price) rescue 'Reserve price must be a number'
        @is_open = false
        @leading_bid = nil
        @has_failed = false
    end
    
    def is_open?
        @is_open
    end
    
    def has_failed?
        @has_failed
    end
    
    def open
        if has_failed?
            @@logger.error "Cannot open, this auction has already failed"
        else
            @is_open = true
        end
    end
    
    def close
        @is_open = false
        if reserve_price > leading_bid.amount
            @has_failed = true
            @@logger.warn "Auction failed to met reserve price"
        end
    end
end