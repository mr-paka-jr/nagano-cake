require 'test_helper'

class Customers::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_items_index_url
    assert_response :success
  end

  test "should get about" do
    get customers_items_about_url
    assert_response :success
  end

  test "should get top" do
    get customers_items_top_url
    assert_response :success
  end

  test "should get show" do
    get customers_items_show_url
    assert_response :success
  end

end
