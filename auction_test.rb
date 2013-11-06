require_relative 'bid'

me = Participant.new('Josh')

item = Item.new('Book',10)

auction = Auction.new(item)

#should fail
bid = Bid.new(auction,me,10)
auction.open
bid = Bid.new(auction,me,10)
#should fail
bid = Bid.new(auction,me,5)
