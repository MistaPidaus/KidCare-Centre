require 'test_helper'

class Instructor::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instructor_dashboard_index_url
    assert_response :success
  end

end
