require 'mechanize'

require './sources/listing.rb'
require './sources/article.rb'

class ArticleAgent
  def initialize
    @agent = Mechanize.new
  end

  def GetArticles(listing)
    puts "start to get articles"
    articles = []
    for link in listing.links
      puts "get article: #{link}"
      article_agent = Mechanize.new
      articles << Article.new(link, article_agent)
    end

    return articles
  end
end