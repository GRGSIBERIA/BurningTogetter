class Article
  def initialize(article_page)
    @page = article_page
    @count = pages.length
    @master = GetMaster()
    @date = nil
    @favorite = GetFavorite()
    @view = GetView()
  end

  def GetMaster()
    path = "div.balloon_module > div.info_description > span > a"
    @master = @page.at(path).inner_text
  end

  def GetFavorite()
    path = "div.info_box > div.info_status > span"
    @favorite = @page.search(path)[0].inner_text.split(' ')[0].to_i
  end

  def GetView()
    path = "div.info_box > div.info_status > span"
    @view = @page.search(path)[1].inner_text.split(' ')[0].to_i
  end

  attr_reader :page, :count
end