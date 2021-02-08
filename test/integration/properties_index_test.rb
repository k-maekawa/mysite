require "test_helper"

class PropertiesIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user     = users(:michael)
    @property = properties(:shibuya)
  end

  test "index check within pagination" do
    log_in_as(@user)
    get properties_path
    assert_template 'properties/index'
    first_page_of_properties = Property.paginate(page: 1)
  end
end
