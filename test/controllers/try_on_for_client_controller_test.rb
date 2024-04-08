require "test_helper"

class TryOnForClientControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get try_on_for_client_index_url
    assert_response :success
  end
end
