#-*- encoding: utf-8
require 'sequel'

db = Sequel.connect('sqlite://database.db')

if db.table_exists?(:articles) then
  db.drop_table(:articles)
end

if db.table_exists?(:comments) then
  db.drop_table(:comments)
end

if db.table_exists?(:users) then
  db.drop_table(:users)
end

db.create_table :articles do
  primary_key :article_id, :unique=>true
  foreign_key :user_id, :table=>:users, :type=>Integer, :null=>false
  Integer :view, :null=>false
  Integer :favorite, :null=>false
  index :article_id
end

db.create_table :comments do
  primary_key :comment_id, :unique=>true
  foreign_key :article_id, :table=>:articles, :type=>Integer, :null=>false
  foreign_key :user_id, :table=>:users, :type=>Integer, :null=>false
  String :text, :null=>false
  Integer :favorite, :null=>false
  index :comment_id
end

db.create_table :users do
  primary_key :user_id, :unique=>true, :null=>false
  String :user_name, :unique=>true, :null=>false
  index :user_id
end