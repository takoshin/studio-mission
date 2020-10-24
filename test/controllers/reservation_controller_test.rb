require 'test_helper'

class ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get count:string" do
    get reservation_count:string_url
    assert_response :success
  end

end
