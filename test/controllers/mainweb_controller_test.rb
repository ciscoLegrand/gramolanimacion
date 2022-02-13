require "test_helper"

class MainwebControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mainweb_index_url
    assert_response :success
  end
end
