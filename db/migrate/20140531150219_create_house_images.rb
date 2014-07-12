class CreateHouseImages < ActiveRecord::Migration
  def change
    create_table :house_images do |t|
      t.integer :house_id
      t.string :picture

      t.timestamps
    end
  end
end
