#-*- encoding: utf-8
require './main.rb'

search_keyword = "無断転載"
range = 1..10

SequelBase.init("./database.db")
articles = GetArticleAndComments(search_keyword, range)
InsertInstances(articles)

puts User.db.where().limit(100).all