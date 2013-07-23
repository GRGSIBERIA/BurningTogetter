#-*- encoding: utf-8
require 'sequel'
#require './initialize.rb'

require './models.rb'
require './sources/listing_agent.rb'
require './sources/article_agent.rb'

search_keyword = "無断転載"
range = 1..1

def GetArticleAndComments(search_keyword, range)
  listing_agent = ListingAgent.new
  listing = listing_agent.Listing(search_keyword, range)

  article_agent = ArticleAgent.new
  return article_agent.GetArticles(listing)
end

SequelBase.init("./database.db")

puts Users.add("test")