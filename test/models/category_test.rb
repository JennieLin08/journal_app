require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save user without category_name" do
    category = Category.new
    assert_not category.save, "Saved the category without a category_name"
  end

  test "should not save user without user_id" do
    category = Category.new
    category.category_name = "sample cat_name"
    assert_not category.save, "Saved the category without a user_id"
  end

end
