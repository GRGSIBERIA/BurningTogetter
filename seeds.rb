#-*- encoding: utf-8
require 'sequel'
#require './initialize.rb'

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

def AddUser(db, user_name)
  begin
    db << {:user_name => user_name, :user_id => 0}
  rescue
    
  end
  return db.where(:user_name => user_name).limit(1).all
end

def AddArticle(db, user, article)
  begin
    db.insert(
      :user_id => user[:user_id].to_i)
  rescue

  end
end

db = Sequel.sqlite("database.db")

AddUser(db[:users], "A")
AddUser(db[:users], "B")
AddUser(db[:users], "C")
puts db[:users].all

