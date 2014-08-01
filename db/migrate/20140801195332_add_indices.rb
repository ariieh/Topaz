class AddIndices < ActiveRecord::Migration
  def change
    add_index :articles, :created_at
    add_index :articles, :title
    
    add_index :notifications, :article_id

    add_index :taggings, :tag_id
    add_index :taggings, :article_id
    
    add_index :users, :email
  end
end
