class AddIndexToPropertiesHouseName < ActiveRecord::Migration[6.1]
  def change
    add_index :properties, :house_name, :unique =>  true
  end
end
