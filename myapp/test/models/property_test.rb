require "test_helper"

class PropertyTest < ActiveSupport::TestCase
  
  def setup
    @property = Property.new(house_name: "渋谷区シェアハウス会館",
                             area_name: "青山・渋谷",
                             house_adress: "東京都渋谷区神南２丁目２",
                             house_station: "渋谷",
                             house_skill: "プログラミング",
                             house_distance: 8,
                             rent: 50000)
  end

  test "should be valid" do
    assert @property.valid?
  end

  test "house_name should be persent" do
    @property.house_name = "     "
    assert_not @property.valid?
  end

  test "house_name should not be too long" do
    @property.house_name = "a" * 51
    assert_not @property.valid?
  end

  test "area_name should be present" do
    @property.area_name = "     "
    assert_not @property.valid?
  end

  test "area_name should not be too long" do
    @property.area_name = "a" * 11
    assert_not @property.valid?
  end

  test "house_adress should be present" do
    @property.house_adress = "     "
    assert_not @property.valid?
  end

  test "house_adress should not be too long" do
    @property.house_adress = "a" * 101
    assert_not @property.valid?
  end

  test "house_station should be present" do
    @property.house_station = "     "
    assert_not @property.valid?
  end

  test "house_station should not be too long" do
    @property.house_station = "a" * 21
    assert_not @property.valid?
  end

  test "house_skill should be present" do
    @property.house_skill = "     "
    assert_not @property.valid?
  end

  test "house_skill should not be too long" do
    @property.house_skill = "a" * 21
    assert_not @property.valid?
  end

  test "house_distance should be present" do
    @property.house_distance = "     "
    assert_not @property.valid?
  end
  
  test "house_distance should not be too long" do
    @property.house_distance = 1 * 3
    assert_not @property.valid?
  end

  test "rent should be present" do
    @property.rent = "     "
    assert_not @property.valid?
  end

  test "rent should not be too short" do
    @property.rent = 1 * 4
    assert_not @property.valid?
  end

  test "rent should not be too long" do
    @property.rent = 1 * 7
    assert_not @property.valid?
  end

  test "property should be unique" do
    duplicate_property = @property.dup
    @property.save
    assert_not duplicate_property.valid?
  end
end