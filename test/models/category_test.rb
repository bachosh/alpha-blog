require 'test_helper'  #yvela test files chirdeba

class CategoryTest < ActiveSupport::TestCase
  
  def setup   # es gaeshveba testebis win
    @category = Category.new(name: "sports")
  end
  
  test "category should be valid" do
    assert @category.valid?
  end
  
  
  test "name should be valid" do
    @category.name=" "
    assert_not @category.valid?
  end
  
  test "name shoul be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end
  
  test "name should not be too long" do
    @category.name="a"*27
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name="aa"
    assert_not @category.valid?
  end  
  
end