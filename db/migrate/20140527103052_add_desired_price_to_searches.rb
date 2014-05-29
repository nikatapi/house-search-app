class AddDesiredPriceToSearches < ActiveRecord::Migration
  def change
  	add_column :searches, :desired_price, :float
  end
end
