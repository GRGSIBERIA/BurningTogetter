class Comment
  def initialize(comment_node)
    @comment_node = comment_node
    @user_name = GetUserName()
    @favorite = GetFavorite()
    @text = GetText()
    @color = nil
  end

  def GetUserName()
    path = "div.status > div.status_right > a.status_name"
    @comment_node.at(path).attribute("href").inner_text.split("/").last
  end

  def GetFavorite()
    path = "div.status > div.status_right > a.icon_fav"
    @comment_node.at(path).inner_text.to_i
  end

  def GetText()
    path = "div.balloon_body > div.tweet"
    @comment_node.at(path).inner_text
  end
  #attr_reader :comment, :user_name, :favorite, :text, :color
end