require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest

  setup do
  end

  test "should get index" do
    get home_index_url
    assert_response :success
  end
end
