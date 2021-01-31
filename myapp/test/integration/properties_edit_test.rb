require "test_helper"

class PropertiesEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @property = properties(:shibuya)
  end

  test "unsuccessful property edit" do
    get edit_property_path(@property)
    assert_template 'properties/edit'
             patch property_path(@property), params: { property: { house_name: "",
                                                                   area_name: "青山・渋谷",
                                                                   house_adress: "東京都渋谷区東2丁目",
                                                                   house_station: "恵比寿",
                                                                   house_skill: "プログラミング",
                                                                   house_distance: 9,
                                                                   rent: 50000} }

    assert_template 'properties/edit'
  end

  test "successful property edit" do
    get edit_property_path(@property)
    assert_template 'properties/edit'
    house_name = "代々木上原会館"
    house_adress = "東京都渋谷区東2丁目"
    house_station = "恵比寿"
    house_skill ="プログラミング"
    house_distance = 9
    rent = 50000
             patch property_path(@property), params: { property: { house_name: house_name,
                                                                   area_name: area_name,
                                                                   house_adress: house_adress,
                                                                   house_station: house_station,
                                                                   house_skill: house_skill,
                                                                   house_distance: house_distance,
                                                                   rent: rent} }
    assert_not flash.empty?
    assert_redirected_to @property
    @property.reload
    assert_equal name,  @property.name
    assert_equal email, @property.email
  end
end
