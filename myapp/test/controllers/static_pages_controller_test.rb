require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "SKILL HOUSE"
  end

  test "should get target" do
    get help_path
    assert_response :success
    assert_select "title", "Target | SKILL HOUSE"
  end
end
