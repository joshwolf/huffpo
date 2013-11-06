require 'securerandom'
require_relative 'item'

class Auction    
    attr_accessor :id, :item, :reserve_price, :is_open, :leading_bid, :has_failed
    
    def initialize(item)
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
    
    def open
        @is_open = true
    end
    
    def close
        @is_open = false
        if 
    end
end