class Article
  def initialize(article_pages)
    @pages = article_pages
    @count = pages.length
  end

  attr_reader :pages, :count
end