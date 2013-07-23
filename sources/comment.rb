class Comment
  def initialize(comment_node)
    @comment_node = comment_node
    @id = GetCommentID()
    @user_id = GetUserID()
    @user_name = GetUserName()
    @favorite = GetFavorite()
    @text = GetText()
    # 色は取れないことがわかったのでやめる
  end

  def GetCommentID()
    path = "div.balloon_module > div.balloon_body"
    @comment_node.at(path).attribute("data-comment-id").inner_text.to_i
  end

  def GetUserID()
    path = "div.balloon_module > div.balloon_body"
    @comment_node.at(path).attribute("data-user-id").inner_text.to_i
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
  attr_reader :comment, :id, :user_id, :user_name, :favorite, :text
end