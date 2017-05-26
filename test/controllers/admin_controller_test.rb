require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get create_part" do
    get :create_part
    assert_response :success
  end

end
