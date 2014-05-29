class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :country
      t.string :city
      t.string :address
      t.float :max_price
      t.float :max_radius

      t.timestamps
    end
  end
end
