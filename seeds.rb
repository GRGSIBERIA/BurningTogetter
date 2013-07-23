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
    db << {:user_name => user_name}
  rescue
    
  end
  return db.where(:user_name => user_name).limit(1).all[0]
end

def AddArticle(db, article_id, user_id, view, favorite)
  begin
    db << {
      :article_id => article_id,
      :user_id  => user_id,
      :view     => view,
      :favorite => favorite}
  rescue

  end
  return db.where(:article_id => db.max(:article_id)).limit(1).all[0]
end

db = Sequel.sqlite("database.db")
