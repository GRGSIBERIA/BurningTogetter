class Comment
  def initialize()
    @comment = nil
    @user_name = nil
    @favorite = nil
    @text = nil
    @color = nil
  end
  attr_reader :comment, :user_name, :favorite, :text, :color
end