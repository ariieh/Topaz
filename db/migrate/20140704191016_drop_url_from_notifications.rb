class DropUrlFromNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :url
    add_column :notifications, :article_id, :integer
  end
end
