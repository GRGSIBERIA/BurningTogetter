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
      articles << @agent.get(link)
    end

    return Article.new(articles)
  end
end