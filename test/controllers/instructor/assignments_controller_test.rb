require 'test_helper'

class Instructor::AssignmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get instructor_assignments_show_url
    assert_response :success
  end

  test "should get create" do
    get instructor_assignments_create_url
    assert_response :success
  end

  test "should get new" do
    get instructor_assignments_new_url
    assert_response :success
  end

  test "should get update" do
    get instructor_assignments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get instructor_assignments_destroy_url
    assert_response :success
  end

end
