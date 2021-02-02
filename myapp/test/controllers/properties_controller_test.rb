require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @property = properties(:shibuya)
  end
  
  test "should get new with login" do
    log_in_as(@user)
    get new_property_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_property_path(@property)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch property_path(@property), params: { property: { house_name: @property.house_name,
                                                          area_name: @property.area_name,
                                                          house_adress: @property.house_adress,
                                                          house_station: @property.house_station,
                                                          house_skill: @property.house_skill,
                                                          house_distance: @property.house_distance,
                                                          rent: @property.rent} }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Property.count' do
      delete property_path(@property)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Property.count' do
      delete property_path(@property)
    end
    assert_redirected_to root_url
  end
end
