require './sources/comment.rb'

class Article
  def initialize(link, agent)
    @agent = agent
    @link = link
    @id = link.split('/').last.to_i
    @page = @agent.get(link)
    @master = GetMaster()
    @date = nil
    @favorite = GetFavorite()
    @view = GetView()
    @comments = GetComments()
  end

  def GetMaster()
    path = "div.balloon_module > div.info_description > span > a"
    @page.at(path).inner_text
  end

  def GetFavorite()
    path = "div.info_box > div.info_status > span"
    @page.search(path)[0].inner_text.split(' ')[0].to_i
  end

  def GetView()
    path = "div.info_box > div.info_status > span"
    @page.search(path)[1].inner_text.split(' ')[0].to_i
  end

  def GetComments()
    path = "div.comment_box > ul > li > div.list_box"
    comment_nodes = @page.search(path)
    comments_array = []
    for comment in comment_nodes
      comments_array << Comment.new(comment)
    end
    comments_array
  end

  attr_reader :link, :id, :page, :master, :favorite, :view, :comments
end