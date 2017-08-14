require 'test_helper'

class OrganizationConnectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_connection = organization_connections(:one)
  end

  test "should get index" do
    get organization_connections_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_connection_url
    assert_response :success
  end

  test "should create organization_connection" do
    assert_difference('OrganizationConnection.count') do
      post organization_connections_url, params: { organization_connection: { organization_id: @organization_connection.organization_id, user_id: @organization_connection.user_id } }
    end

    assert_redirected_to organization_connection_url(OrganizationConnection.last)
  end

  test "should show organization_connection" do
    get organization_connection_url(@organization_connection)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_connection_url(@organization_connection)
    assert_response :success
  end

  test "should update organization_connection" do
    patch organization_connection_url(@organization_connection), params: { organization_connection: { organization_id: @organization_connection.organization_id, user_id: @organization_connection.user_id } }
    assert_redirected_to organization_connection_url(@organization_connection)
  end

  test "should destroy organization_connection" do
    assert_difference('OrganizationConnection.count', -1) do
      delete organization_connection_url(@organization_connection)
    end

    assert_redirected_to organization_connections_url
  end
end
