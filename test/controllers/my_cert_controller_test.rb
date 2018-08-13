require 'test_helper'

class MyCertControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_cert_index_url
    assert_response :success
  end

end
