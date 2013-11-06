require 'securerandom'
require_relative 'item'

class Auction    
    attr_accessor :id, :item, :is_open, :leading_bid
    
    def initialize(item)
        @id = SecureRandom.uuid
        @item = item
        @is_open = false
        @leading_bid = nil
    end
    
    def is_open?
        @is_open
    end
    
    def open
        @is_open = true
    end
    
    def close
        @is_open = false
    end
end