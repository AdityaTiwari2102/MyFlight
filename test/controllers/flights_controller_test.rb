require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flight = flights(:one)
    @other_user = users(:lana)
  end

  test "should get new" do
    get new_flight_url
    assert_response :success
  end

  test "should create flight" do
    assert_difference('Flight.count') do
      post flights_url, params: { flight: { airplane_type: @flight.airplane_type,
         airline_name: @flight.airline_name, flight_code: @flight.flight_code } }
    end

    assert_redirected_to flight_url(Flight.last)
  end

  test "should show flight" do
    get flight_url(@flight)
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get flights_url
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get edit_flight_url(@flight)
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch flight_url(@flight), params: { flight: { airplane_type: @flight.airplane_type,
       airline_name: @flight.airline_name, flight_code: @flight.flight_code } }
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Flight.count' do
      delete flight_url(@flight)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Flight.count' do
      delete flight_url(@flight)
    end
    assert_redirected_to root_url
  end
end
