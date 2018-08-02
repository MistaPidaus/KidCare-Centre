require 'test_helper'

class AssignmentMarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment_mark = assignment_marks(:one)
  end

  test "should get index" do
    get assignment_marks_url
    assert_response :success
  end

  test "should get new" do
    get new_assignment_mark_url
    assert_response :success
  end

  test "should create assignment_mark" do
    assert_difference('AssignmentMark.count') do
      post assignment_marks_url, params: { assignment_mark: { assignment_id: @assignment_mark.assignment_id, file: @assignment_mark.file, marks: @assignment_mark.marks, user_id: @assignment_mark.user_id } }
    end

    assert_redirected_to assignment_mark_url(AssignmentMark.last)
  end

  test "should show assignment_mark" do
    get assignment_mark_url(@assignment_mark)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignment_mark_url(@assignment_mark)
    assert_response :success
  end

  test "should update assignment_mark" do
    patch assignment_mark_url(@assignment_mark), params: { assignment_mark: { assignment_id: @assignment_mark.assignment_id, file: @assignment_mark.file, marks: @assignment_mark.marks, user_id: @assignment_mark.user_id } }
    assert_redirected_to assignment_mark_url(@assignment_mark)
  end

  test "should destroy assignment_mark" do
    assert_difference('AssignmentMark.count', -1) do
      delete assignment_mark_url(@assignment_mark)
    end

    assert_redirected_to assignment_marks_url
  end
end
