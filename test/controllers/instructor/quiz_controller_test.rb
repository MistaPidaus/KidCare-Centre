require 'test_helper'

class Instructor::QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get instructor_quiz_show_url
    assert_response :success
  end

  test "should get index" do
    get instructor_quiz_index_url
    assert_response :success
  end

  test "should get new" do
    get instructor_quiz_new_url
    assert_response :success
  end

  test "should get update" do
    get instructor_quiz_update_url
    assert_response :success
  end

  test "should get destroy" do
    get instructor_quiz_destroy_url
    assert_response :success
  end

  test "should get question" do
    get instructor_quiz_question_url
    assert_response :success
  end

  test "should get answer" do
    get instructor_quiz_answer_url
    assert_response :success
  end

end
