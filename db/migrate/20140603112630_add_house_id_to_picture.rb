class AddHouseIdToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :house_id, :integer
  end
  add_index :pictures, :house_id
end
