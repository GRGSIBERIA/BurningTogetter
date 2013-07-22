#-*- encoding: utf-8
require './sources/listing_agent.rb'
require './sources/article_agent.rb'

listing_agent = ListingAgent.new
listing = listing_agent.Listing("無断転載", 1..3)