require 'test_helper'

class Instructor::UnitsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get instructor_units_show_url
    assert_response :success
  end

  test "should get create" do
    get instructor_units_create_url
    assert_response :success
  end

  test "should get new" do
    get instructor_units_new_url
    assert_response :success
  end

  test "should get update" do
    get instructor_units_update_url
    assert_response :success
  end

  test "should get destroy" do
    get instructor_units_destroy_url
    assert_response :success
  end

end
