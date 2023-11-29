require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should get create" do
    post create_user_path, params:{user:{name:"jen",email:"user@mail.com",password:"12345"}}
    assert_response :redirect
  end
end
