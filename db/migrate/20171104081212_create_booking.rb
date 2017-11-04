class CreateBooking < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.float :lat
      t.float :lng
      t.monetize :price
      t.monetize :fee
      t.monetize :total_amount
      t.integer :kwh
      t.timestamps
    end
  end
end
