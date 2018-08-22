require 'test_helper'

class Instructor::AssignmentMarksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get instructor_assignment_marks_show_url
    assert_response :success
  end

  test "should get edit" do
    get instructor_assignment_marks_edit_url
    assert_response :success
  end

end
