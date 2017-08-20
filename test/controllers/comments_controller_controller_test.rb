require 'test_helper'

class CommentsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comments_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get comments_controller_show_url
    assert_response :success
  end

  test "should get create" do
    get comments_controller_create_url
    assert_response :success
  end

  test "should get destroy" do
    get comments_controller_destroy_url
    assert_response :success
  end

end
