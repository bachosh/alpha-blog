require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
       @user=User.create(username:'Admin1', email:'admin1@a.a', password:'a', admin: true)
  end  
  
  test "get new category  form and create category" do
      sign_in_as(@user,'a')
      
      get new_category_path # vamowmebt  links
    
      assert_template 'categories/new' # vamowmebt templates html.erb files 
    
      assert_difference 'Category.count', 1 do   #gansxvaveba unda iyos 'category.count'  da  1 shoris
     
      post_via_redirect categories_path, category: {name: "sports"} # post_via_redirect aris http post request to category_path, gadavcemt category.names mnishvnelobit
     
      
      assert_template 'categories/index' # vamowmebt templates html.erb files 
      
      assert_match "sports", response.body   # zemot mocemuli tamplate is body shi tu aris "sports"
      
      end  
  end  
  
  test "invalid category submission results in failure" do
      sign_in_as(@user,'a')    
      get new_category_path
      assert_template 'categories/new'
          assert_no_difference 'Category.count' do
          post categories_path, category: {name: " "}
      end
      assert_template 'categories/new'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
  end
  
  
  
  
  
end