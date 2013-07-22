require 'mechanize'

require './sources/listing.rb'

class ArticleAgent
  def initialize
    @agent = Mechanize.new
  end

  def GetArticles(listing)
    puts "start to get articles"
    articles = []
    for link in listing.links
      articles << Article.new(@agent.get(link))
    end

    return articles
  end
end