class AddForeignkeyToSearches < ActiveRecord::Migration
  def change
  end
  add_index :searches, :user_id
end
