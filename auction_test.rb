require_relative 'bid'

josh = Participant.new('Josh')

item = Item.new('Book',10)

auction = Auction.new(item)

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

