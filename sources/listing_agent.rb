require 'mechanize'
require 'cgi'

require './source/listing.rb'

class ListingAgent
  def initialize
    @agent = Mechanize.new
  end

  def Listing(keyword, range)
    puts "start listing: keyword=>#{keyword}, range=>#{range}"
    pages = []
    for page_num in range
      page = GetSearching(keyword, page_num)
      if page != nil then
        pages << page
      end
    end
    puts "end listing: count=>#{pages.length}"
    puts ""
    return Listing.new(pages, keyword, range)
  end

  def GetSearching(keyword, page_num)
    keyword = CGI.escape(keyword.toutf8)
    url = "http://togetter.com/search?q=#{keyword}&t=q&page=#{page_num}"
    puts "getting: #{url}"
    begin
      page = @agent.get(url)
      if page.at("html").inner_text.include?("検索結果が見つかりませんでした。") then
        raise IndexError
      end
      return page
    rescue
      puts "failed: #{url}"
      return nil
    end
  end

  private :GetSearching
end