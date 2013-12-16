require 'test_helper'

class BikeRegsControllerTest < ActionController::TestCase
  setup do
    @bike_reg = bike_regs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bike_regs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bike_reg" do
    assert_difference('BikeReg.count') do
      post :create, bike_reg: {  }
    end

    assert_redirected_to bike_reg_path(assigns(:bike_reg))
  end

  test "should show bike_reg" do
    get :show, id: @bike_reg
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bike_reg
    assert_response :success
  end

  test "should update bike_reg" do
    put :update, id: @bike_reg, bike_reg: {  }
    assert_redirected_to bike_reg_path(assigns(:bike_reg))
  end

  test "should destroy bike_reg" do
    assert_difference('BikeReg.count', -1) do
      delete :destroy, id: @bike_reg
    end

    assert_redirected_to bike_regs_path
  end
end
