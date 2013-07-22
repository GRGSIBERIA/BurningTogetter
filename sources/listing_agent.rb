require 'mechanize'
require 'cgi'

class ListingAgent
  def initialize
    @agent = Mechanize.new
  end

  def Listing(keyword, range)
    pages = []
    for page_num in range
      pages << GetSearching(keyword, page_num)
    end
  end

  def GetSearching(keyword, page_num)
    keyword = CGI.escape(keyword.toutf8)
    url = "http://togetter.com/search?q=#{keyword}&t=q&page=#{page_num}"
    @agent.get(url)
  end

  private :GetSearching
end