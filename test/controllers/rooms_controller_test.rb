require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @room = rooms(:one)
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should redirect edit when not logged in" do
    get edit_room_path(@room)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch room_path(@room), params: { room: { vacant_room: "空室",
                                             room_number: 205,
                                             space: 20.6,
                                             room_type: "ドミトリー",
                                             room_img: "20190806_2099476.jpg" } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference "Room.count" do
      delete room_path(@room)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in" do
    log_in_as(@other_user)
    assert_no_difference "Room.count" do
      delete room_path(@room)
    end
    assert_redirected_to root_url
  end

  test "should redirect destroy for non-admin" do
    log_in_as(@other_user)
    assert_no_difference "Room.count" do
      delete room_path(@room)
    end
    assert_redirected_to root_path
  end
end
