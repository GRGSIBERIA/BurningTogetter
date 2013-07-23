require 'sequel'
require 'openssl'
require 'mechanize'

class SequelBase
  @@db = nil
  @@user = nil
  @@article = nil
  @@comment = nil
  @@agent = Mechanize.new

  def self.init(dbfile)
    @@agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @@db = Sequel.sqlite("database.db")
    @@user = @@db[:users]
    @@article = @@db[:articles]
    @@comment = @@db[:comments]
  end
end

class Article < SequelBase
  def self.add_record(article_id, user_id, view, favorite)
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

  def self.add(article, user_id)
    Article.add_record(article.id, user_id, article.view, article.favorite)
  end
end

class User < SequelBase
  def self.add(user_id, user_name)
    begin
      @@user << {
        :user_id   => user_id,
        :user_name => user_name}
    rescue
      
    end
    return @@user.where(:user_name => user_name).limit(1).all[0]
  end

  def self.add_master(user_name)
    exist_user = @@user.where(:user_name => user_name).limit(1).all
    begin
      if exist_user.length == 0 || exist_user == nil then
        user_id = User.twitter_id(user_name)
        if user_id != nil then
          exist_user = User.add(user_id, user_name)
          return exist_user
        end
      end
    rescue

    end
    return exist_user[0]
  end

  def self.twitter_id(user_name)
    user_id = nil
    begin
      page = @@agent.get("https://twitter.com/#{user_name}")
      selector = "div.profile-card > div.profile-header-inner > div.profile-card-inner"
      user_id = page.at(selector).attribute("data-user-id").inner_text
    rescue
      user_id = nil
    end
    return user_id
  end
end

class Comment < SequelBase
  def self.add_record(comment_id, article_id, user_id, text, favorite)
    begin
      @@comment << {
        :comment_id => comment_id,
        :article_id => article_id,
        :user_id    => user_id,
        :text       => text,
        :favorite   => favorite}
    rescue

    end
    return @@comment.where(:comment_id => comment_id).limit(1).all[0]
  end

  def self.add(article, comment)
    Comment.add_record(comment.id, article.id, comment.user_id, comment.text, comment.favorite)
  end
end