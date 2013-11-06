require 'securerandom'

class Participant
    attr_accessor :id, :name
    
    def initialize(name)
        @id = SecureRandom.uuid
        @name = name
    end
    
    def bid(auction, amount)
        my_bid = Bid.new(auction, self, amount)
    end
end