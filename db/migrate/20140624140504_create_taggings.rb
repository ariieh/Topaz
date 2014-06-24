class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id, null: false
      t.integer :article_id, null: false
      t.timestamps
    end
    
    add_index :taggings, [:article_id, :tag_id], unique: true
  end
end