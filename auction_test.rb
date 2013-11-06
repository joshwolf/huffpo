require_relative 'bid'

josh = Participant.new('Josh')

item = Item.new('Book')

auction = Auction.new(item,10)
another_auction = Auction.new(item,100)

#should fail
josh.bid(auction,10)

auction.open
josh.bid(auction,10)

susan = Participant.new('Susan')
susan.bid(auction,15)

#should fail
josh.bid(auction,15)

auction.close
#should fail
josh.bid(auction,20)

another_auction.open

josh.bid(another_auction,10)
#should mark auction as failure
another_auction.close

#should fail
another_auction.open