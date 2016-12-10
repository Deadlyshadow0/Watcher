require 'test_helper'

class BusLocationsControllerTest < ActionController::TestCase
  setup do
    @bus_location = bus_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bus_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bus_location" do
    assert_difference('BusLocation.count') do
      post :create, bus_location: { bus_route_id: @bus_location.bus_route_id, latitude: @bus_location.latitude, longitude: @bus_location.longitude }
    end

    assert_redirected_to bus_location_path(assigns(:bus_location))
  end

  test "should show bus_location" do
    get :show, id: @bus_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bus_location
    assert_response :success
  end

  test "should update bus_location" do
    patch :update, id: @bus_location, bus_location: { bus_route_id: @bus_location.bus_route_id, latitude: @bus_location.latitude, longitude: @bus_location.longitude }
    assert_redirected_to bus_location_path(assigns(:bus_location))
  end

  test "should destroy bus_location" do
    assert_difference('BusLocation.count', -1) do
      delete :destroy, id: @bus_location
    end

    assert_redirected_to bus_locations_path
  end
end
