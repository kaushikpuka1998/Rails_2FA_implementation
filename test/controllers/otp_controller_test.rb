require 'test_helper'

class OtpControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get otp_new_url
    assert_response :success
  end

  test "should get create" do
    get otp_create_url
    assert_response :success
  end

end
