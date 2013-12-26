require 'test_helper'

class IncomingEmailControllerTest < ActionController::TestCase
  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get bounce" do
    get :bounce
    assert_response :success
  end

end
