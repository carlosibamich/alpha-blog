require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "John", email: "john@email.com", password: "password", admin: true)
  end

  test "Should get categories index" do
    get categories_path
    assert_response :success
  end

  test "Should get categories show" do
    get category_path(@category)
    assert_response :success
  end

  test "Should get categories new" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end

  test "Should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: {name: "Sports"} }
    end
    assert_redirected_to categories_path
  end

end
