require 'test_helper'

class Customers::AdressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_adresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get customers_adresses_edit_url
    assert_response :success
  end

end
