class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :description
      t.integer :user_id
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :country
      t.string :city
      t.float :price

      t.timestamps
    end
    add_index :houses, :user_id
  end
end
