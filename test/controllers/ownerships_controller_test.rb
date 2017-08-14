require 'test_helper'

class OwnershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ownership = ownerships(:one)
  end

  test "should get index" do
    get ownerships_url
    assert_response :success
  end

  test "should get new" do
    get new_ownership_url
    assert_response :success
  end

  test "should create ownership" do
    assert_difference('Ownership.count') do
      post ownerships_url, params: { ownership: { owned_org_id: @ownership.owned_org_id, owner_id: @ownership.owner_id, relation: @ownership.relation } }
    end

    assert_redirected_to ownership_url(Ownership.last)
  end

  test "should show ownership" do
    get ownership_url(@ownership)
    assert_response :success
  end

  test "should get edit" do
    get edit_ownership_url(@ownership)
    assert_response :success
  end

  test "should update ownership" do
    patch ownership_url(@ownership), params: { ownership: { owned_org_id: @ownership.owned_org_id, owner_id: @ownership.owner_id, relation: @ownership.relation } }
    assert_redirected_to ownership_url(@ownership)
  end

  test "should destroy ownership" do
    assert_difference('Ownership.count', -1) do
      delete ownership_url(@ownership)
    end

    assert_redirected_to ownerships_url
  end
end
