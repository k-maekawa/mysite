require "test_helper"

class PropertyNewTest < ActionDispatch::IntegrationTest

test "invalid property infomation make" do
  get properties_new_path
  assert_no_difference 'Property.count' do
    post properties_path, params: { property: { house_name: "渋館",
                                                area_name: "横浜・青葉",
                                                house_adress: "東京都２丁目",
                                                house_station: "",
                                                house_skill: "",
                                                house_distance: 200 ,
                                                rent: 00 }}
    end
    assert_template 'properties/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
  end

  test "valid property infomation make" do
    get properties_new_path
    assert_difference 'Property.count', 1 do
      post properties_path, params: { property: { house_name: "渋谷区シェアハウス公民館",
                                                  area_name: "青山・渋谷",
                                                  house_adress: "東京都渋谷区神南２丁目３",
                                                  house_station: "渋谷",
                                                  house_skill: "プログラミング",
                                                  house_distance: 8,
                                                  rent: 50000}}
      end
    follow_redirect!
    assert_template 'properties/show'
    assert_not flash.empty?
  end
end
