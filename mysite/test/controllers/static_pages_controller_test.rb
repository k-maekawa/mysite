require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_pages_index_url
    assert_response :success
  end

  test "should get create" do
    get static_pages_create_url
    assert_response :success
  end

  test "should get edit" do
    get static_pages_edit_url
    assert_response :success
  end

  test "should get show" do
    get static_pages_show_url
    assert_response :success
  end
end
