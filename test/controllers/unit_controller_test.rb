require 'test_helper'

class UnitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get unit_index_url
    assert_response :success
  end

  test "should get new" do
    get unit_new_url
    assert_response :success
  end

end
