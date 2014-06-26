class AddAttachmentPhotoToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :articles, :photo
  end
end
