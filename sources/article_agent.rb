require 'mechanize'

require './sources/listing.rb'

class ArticleAgent
  def initialize
    @agent = Mechanize.new
  end

  def GetArticles(listing)
end