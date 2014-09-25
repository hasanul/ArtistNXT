require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get upload_image" do
    get :upload_image
    assert_response :success
  end

  test "should get upload_video" do
    get :upload_video
    assert_response :success
  end

  test "should get follower_fans" do
    get :follower_fans
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

end
