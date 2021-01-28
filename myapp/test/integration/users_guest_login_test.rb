require "test_helper"

class UsersGuestLoginTest < ActionDispatch::IntegrationTest

  test "guest-login with valid email/invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { name: "GuestUser",
                                          email: 'guest@example.com',
                                          password: "invalid" } }
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
