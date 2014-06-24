class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :author_id, null: false
      t.timestamps
    end
    
    add_index :articles, :author_id
    add_index :articles, [:title, :author_id], unique: true
  end
end
