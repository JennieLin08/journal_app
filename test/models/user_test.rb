require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "should not save user without name" do
    user = User.new
    assert_not user.save, "Saved the user without a name"
  end
  test "should not save user without email" do
    user = User.new
    user.name ="jen"
    user.password ="12345"
    assert_not user.save, "Saved the user without a email"
  end
  test "should not save user without password" do
    user = User.new
    user.name ="jen"
    user.email ="user@mail.com"
    assert_not user.save, "Saved the user without a password"
  end
end
