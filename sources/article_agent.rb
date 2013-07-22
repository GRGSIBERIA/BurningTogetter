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
      articles << Article.new(link, @agent.get(link))
    end

    return articles
  end
end