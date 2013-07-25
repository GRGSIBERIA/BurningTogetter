require "./sources/models.rb"

def Clustering(keyword)
  articles_with_keyword = Article.db.where(:search_keyword => keyword).all

  for article in articles_with_keyword
    unique_users_from_comment = Comment.db.where(:article_id => article[:article_id]).distinct(:user_id).all
  end
end