class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :house, index: true
      t.belongs_to :user, index: true
      t.datetime :from
      t.datetime :until

      t.timestamps
    end
  end
end
