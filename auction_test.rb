require_relative 'bid'
require_relative 'auction_house'
require 'logger'

@@logger = Logger.new(STDOUT)

auction_house = AuctionHouse.new
josh = Participant.new('Josh')

item = Item.new('Book')

auction = auction_house.add_auction(item,10)

#should fail
josh.bid(auction,10)

auction.open
josh.bid(auction,10)

#show most recent auction
@@logger.info(auction_house.most_recent_auction_info('Book'))

susan = Participant.new('Susan')
susan.bid(auction,15)

#should fail
josh.bid(auction,15)

auction.close
#should fail
josh.bid(auction,20)

#show most recent auction
@@logger.info(auction_house.most_recent_auction_info('Book'))

another_auction = auction_house.add_auction(item,100)

another_auction.open

josh.bid(another_auction,10)
#should mark auction as failure
another_auction.close

#should fail
another_auction.open

#should fail because auction previously failed
yet_another_auction = auction_house.add_auction(item,1000)

#show most recent auction
@@logger.info(auction_house.most_recent_auction_info('Book'))

