class Listing
  def initialize(pages, keyword, range)
    @pages = pages
    @count = pages.length
    @keyword = keyword
    @range = range
    @links = GetArticleLinks()
  end

  def GetArticleLinks()
    article_links = []
    puts "start to get links"
    for i in 0..@pages.length-1
      article_links += GetArticleLinksInListingPage(i)
    end
    puts "end to get links: count=> #{article_links.length}"
    puts ""
    return article_links
  end

  def GetArticleLinksInListing(topics_links)
    links = []
    topics_links.each{|x| links << x.attribute("href").inner_text}
    return links
  end

  def GetArticleLinksInListingPage(i)
    puts "getting links in page #{i+1}"
    path = "div.topics_link_box > ul > li > h3 > a.topics_link"
    topics_links = @pages[i].search(path)
    return GetArticleLinksInListing(topics_links)
  end

  attr_reader :pages, :count, :keyword, :range, :links
end