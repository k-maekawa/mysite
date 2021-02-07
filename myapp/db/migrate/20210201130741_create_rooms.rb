class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :vacant_room
      t.integer :room_number
      t.float :space
      t.string :room_type
      t.string :room_img
      t.references :property, foreign_key: true

      t.timestamps
    end
    add_index :rooms, [:property_id, :created_at]
  end
end
