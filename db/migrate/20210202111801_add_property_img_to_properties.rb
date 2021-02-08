class AddPropertyImgToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :property_img, :string
  end
end
