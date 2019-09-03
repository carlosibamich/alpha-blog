require 'test_helper'

class CListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category1 = Category.create(name: "Robots")
    @category2 = Category.create(name: "Analog")
  end

  test "Should show categories list" do
    get categories_path
    assert_template 'categories/index'
    assert_select 'a[href=?]', category_path(@category1), text: @category1.name
    assert_select 'a[href=?]', category_path(@category2), text: @category2.name
  end

end
