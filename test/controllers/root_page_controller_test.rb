require 'test_helper'

class RootPageControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "MyFlight"
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

end
