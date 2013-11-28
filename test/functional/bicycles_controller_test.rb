require 'test_helper'

class BicyclesControllerTest < ActionController::TestCase
  setup do
    @bicycle = bicycles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bicycles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bicycle" do
    assert_difference('Bicycle.count') do
      post :create, bicycle: { city: @bicycle.city, color: @bicycle.color, country: @bicycle.country, gears: @bicycle.gears, lookup_code: @bicycle.lookup_code, make: @bicycle.make, model: @bicycle.model, owner_alternate_name: @bicycle.owner_alternate_name, owner_name: @bicycle.owner_name, serial: @bicycle.serial, size: @bicycle.size, state: @bicycle.state, type: @bicycle.type }
    end

    assert_redirected_to bicycle_path(assigns(:bicycle))
  end

  test "should show bicycle" do
    get :show, id: @bicycle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bicycle
    assert_response :success
  end

  test "should update bicycle" do
    put :update, id: @bicycle, bicycle: { city: @bicycle.city, color: @bicycle.color, country: @bicycle.country, gears: @bicycle.gears, lookup_code: @bicycle.lookup_code, make: @bicycle.make, model: @bicycle.model, owner_alternate_name: @bicycle.owner_alternate_name, owner_name: @bicycle.owner_name, serial: @bicycle.serial, size: @bicycle.size, state: @bicycle.state, type: @bicycle.type }
    assert_redirected_to bicycle_path(assigns(:bicycle))
  end

  test "should destroy bicycle" do
    assert_difference('Bicycle.count', -1) do
      delete :destroy, id: @bicycle
    end

    assert_redirected_to bicycles_path
  end
end
