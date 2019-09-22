require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get first_name" do
    get authors_first_name_url
    assert_response :success
  end

  test "should get last_name" do
    get authors_last_name_url
    assert_response :success
  end

end
