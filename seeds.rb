#-*- encoding: utf-8
require 'sequel'
#require './initialize.rb'

require './sources/listing_agent.rb'
require './sources/article_agent.rb'

listing_agent = ListingAgent.new
listing = listing_agent.Listing("無断転載", 1..1)

article_agent = ArticleAgent.new
articles = article_agent.GetArticles(listing)

for article in articles
  puts "----------------------"
  puts article.master
  for comment in article.comments
    puts "#{comment.user_name}: #{comment.text.tosjis}"
  end
  puts "----------------------"
end