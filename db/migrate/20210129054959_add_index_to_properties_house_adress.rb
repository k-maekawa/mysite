class AddIndexToPropertiesHouseAdress < ActiveRecord::Migration[6.1]
  def change
    add_index :properties, :house_adress, :unique =>  true
  end
end