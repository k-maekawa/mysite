class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :house_name
      t.string :area_name
      t.string :house_adress
      t.string :house_station
      t.string :house_skill
      t.integer :house_distance
      t.integer :rent

      t.timestamps
    end
  end
end
