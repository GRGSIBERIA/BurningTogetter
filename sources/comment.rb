class Comment
  def initialize(comment_node)
    @comment_node = comment_node
    @user_name = GetUserName()
    @favorite = nil
    @text = nil
    @color = nil
  end

  def GetUserName()
    path = "div.status > div.status_right > a.status_name"
    @comment_node.at(path).attribute("href").inner_text.split("/").last
  end
  #attr_reader :comment, :user_name, :favorite, :text, :color
end