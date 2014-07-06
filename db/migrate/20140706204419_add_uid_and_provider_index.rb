class AddUidAndProviderIndex < ActiveRecord::Migration
  def change
    add_index :users, :provider
    add_index :users, :uid
  end
end
