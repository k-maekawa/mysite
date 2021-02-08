class AddRentToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :rent, :integer
  end
end
