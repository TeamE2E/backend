class CreateOffer < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.integer :user_id
      t.monetize :price
      t.integer :available_kwh
      t.integer :min_kwh
    end
  end
end
