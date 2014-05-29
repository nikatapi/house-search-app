class AddUseridToSearches < ActiveRecord::Migration
  def change
  	add_column :searches, :user_id, :integer
  end
  add_index :searches, :user_id
end
