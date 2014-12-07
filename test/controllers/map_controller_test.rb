require 'test_helper'

class MapControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get getheatpoints" do
    get :getheatpoints
    assert_response :success
  end
end
