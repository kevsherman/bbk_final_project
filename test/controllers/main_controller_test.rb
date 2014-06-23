require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get event" do
    get :event
    assert_response :success
  end

end
