require 'sequel'

db = Sequel.connect('sqlite://database.db')

if db.table_exists?(:articles) then
  db.drop_table(:articles)
end

db.create_table :articles do
  primary_key :article_id
  foreign_key :master_user_id, :users, :type=>Integer
  Integer :view
  Integer :favorite
  index :article_id
end

if db.table_exists?(:comments) then
  db.drop_table(:comments)
end

db.create_table :comments do
  prymary_key :comment_id
  foreign_key :article_id, :articles, :type=>Integer
  foreign_key :user_id, :users, :type=>Integer
  String :text
  Integer :favorite
  index :comment_id
end

if db.table_exists?(:comments) then
  db.drop_table(:users)
end

db.create_table :users do
  prymary_key :user_id
  String :user_name
  index :user_id
end