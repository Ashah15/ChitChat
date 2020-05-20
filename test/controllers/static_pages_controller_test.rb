require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
    test "should get connect" do
    get static_pages_connect_url
    assert_response :success
  end

  test "should get notifications" do
    get static_pages_notifications_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
  end
end
