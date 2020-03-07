require 'test_helper'

class Public::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_dashboard_index_url
    assert_response :success
  end

end
