require "test_helper"

class RoomTest < ActiveSupport::TestCase
  def setup
    @property = properties(:shibuya)
    @room = @property.rooms.build(vacant_room: "空室",
                                  room_number: 201,
                                  space: 6.4,
                                  room_type: "個室",
                                  room_img: "20190806_2099476.jpg",
                                  property_id: @property.id) 
  end

  test "should be valid" do
    assert @room.valid?
  end

  test "property id should be present" do
    @room.property_id = nil
    assert_not @room.valid?
  end

  test "vacant_room should be present" do
    @room.vacant_room = "   "
    assert_not @room.valid?
  end

  test "room_number should be short" do
    @room.room_number = 1 * 2
    assert_not @room.valid?
  end

  test "room_number should be long" do
    @room.room_number = 1 * 5
    assert_not @room.valid?
  end

  test "space should be present" do
    @room.space = "  "
    assert_not @room.valid?
  end

  test "space should be too small" do
    @room.space = 1
    assert_not @room.valid?
  end

  test "space should be too large" do
    @room.space = 101
    assert_not @room.valid?
  end

  test "room_type should be present" do
    @room.room_type = "  "
    assert_not @room.valid?
  end
end
