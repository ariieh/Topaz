class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :author_id
      t.integer :article_id
      t.integer :p_id
      t.timestamps
    end
    
    add_index :comments, :author_id
    add_index :comments, :article_id
  end
end