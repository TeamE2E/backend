class AddIndexToLocation < ActiveRecord::Migration[5.1]
  def change
    add_index :locations, :lat
    add_index :locations, :lng
    add_index :locations, :user_id, unique: true
  end
end
