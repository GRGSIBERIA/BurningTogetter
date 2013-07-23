require 'sequel'

class SequelBase
  @@db = nil
  @@user = nil
  @@article = nil
  @@comment = nil

  def self.init(dbfile)
    @@db = Sequel.sqlite("database.db")
    @@user = @@db[:users]
    @@article = @@db[:articles]
    @@comment = @@db[:comments]
  end
end

class Articles < SequelBase
  def self.add(db, article_id, user_id, view, favorite)
    begin
      @@article << {
        :article_id => article_id,
        :user_id  => user_id,
        :view     => view,
        :favorite => favorite}
    rescue

    end
    return @@article.where(:article_id => article_id).limit(1).all[0]
  end
end

class Users < SequelBase
  def self.add(user_id, user_name)
    begin
      @@user << {
        :user_id   => user_id,
        :user_name => user_name}
    rescue
      
    end
    return @@user.where(:user_name => user_name).limit(1).all[0]
  end
end

class Comments < SequelBase
  def self.add(comment_id, article_id, user_id, text, favorite)
    begin
      @@comment << {
        :comment_id => comment_id,
        :article_id => article_id,
        :user_id    => user_id,
        :text       => text,
        :favorite   => favorite}
    rescue

    end
    return @@comment.where(:comment_id => @@comment.max(:comment_id)).limit(1).all[0]
  end
end