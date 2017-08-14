require 'test_helper'

class UserConnectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_connection = user_connections(:one)
  end

  test "should get index" do
    get user_connections_url
    assert_response :success
  end

  test "should get new" do
    get new_user_connection_url
    assert_response :success
  end

  test "should create user_connection" do
    assert_difference('UserConnection.count') do
      post user_connections_url, params: { user_connection: { connectee_id: @user_connection.connectee_id, user_id: @user_connection.user_id } }
    end

    assert_redirected_to user_connection_url(UserConnection.last)
  end

  test "should show user_connection" do
    get user_connection_url(@user_connection)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_connection_url(@user_connection)
    assert_response :success
  end

  test "should update user_connection" do
    patch user_connection_url(@user_connection), params: { user_connection: { connectee_id: @user_connection.connectee_id, user_id: @user_connection.user_id } }
    assert_redirected_to user_connection_url(@user_connection)
  end

  test "should destroy user_connection" do
    assert_difference('UserConnection.count', -1) do
      delete user_connection_url(@user_connection)
    end

    assert_redirected_to user_connections_url
  end
end
