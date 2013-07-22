class Article
  def initialize(article_page)
    @page = article_pages
    @count = pages.length
    @master = nil
    @date = nil
    @favorite = nil
    @view = nil
  end

  attr_reader :page, :count
end