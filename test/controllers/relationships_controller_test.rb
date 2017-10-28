require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get connect_user" do
    get relationships_connect_user_url
    assert_response :success
  end

  test "should get disconnect_user" do
    get relationships_disconnect_user_url
    assert_response :success
  end

end
