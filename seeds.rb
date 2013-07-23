#-*- encoding: utf-8
require 'sequel'
#require './initialize.rb'

require './models.rb'
require './sources/listing_agent.rb'
require './sources/article_agent.rb'

def GetArticleAndComments(search_keyword, range)
  listing_agent = ListingAgent.new
  listing = listing_agent.Listing(search_keyword, range)

  article_agent = ArticleAgent.new
  return article_agent.GetArticles(listing)
end

def InsertInstances(articles)
  SequelBase.init("./database.db")

  for article_inst in articles
    puts "==============================="
    master = User.add_master(article_inst.master)
    article = Article.add(article_inst, master[:user_id])
    puts article
    for comment_inst in article_inst.comments
      user = User.add(comment_inst.user_id, comment_inst.user_name)
      comment = Comment.add(article_inst, comment_inst)
    end
  end
end

search_keyword = "無断転載"
range = 10000..10001

articles = GetArticleAndComments(search_keyword, range)
InsertInstances(articles)