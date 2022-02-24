require "test_helper"

class InventoryUpdatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inventory_updates_new_url
    assert_response :success
  end

  test "should get create" do
    get inventory_updates_create_url
    assert_response :success
  end

  test "should get edit" do
    get inventory_updates_edit_url
    assert_response :success
  end

  test "should get update" do
    get inventory_updates_update_url
    assert_response :success
  end

  test "should get destroy" do
    get inventory_updates_destroy_url
    assert_response :success
  end

  test "should get show" do
    get inventory_updates_show_url
    assert_response :success
  end
end
