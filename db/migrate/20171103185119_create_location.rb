class CreateLocation < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.float :lat
      t.float :lng
      t.string :address
      t.timestamps
    end
  end
end