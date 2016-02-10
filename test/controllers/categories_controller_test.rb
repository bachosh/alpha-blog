require 'test_helper'

class CategoriesControllerTest< ActionController::TestCase
  
  def setup
    @category=Category.create(name:"sports")
    @user=User.create(username:'Admin1', email:'admin1@a.a', password:'a', admin: true)
  end
  
  
  
  test "should get categories index" do
    get :index
    assert_response :success
  end
  
  
  test "should get new" do
    session[:user_id]=@user.id 
    get :new
    assert_response :success
  end

  test "should get show" do
    get(:show,{'id'=>@category.id})    # get s chirdeba id ris mixedvitac unda achvenos. amit gadavcemt categoris id s
    assert_response :success
  end
  
  test "should redirect create when admin not logged in" do
        assert_no_difference 'Category.count' do    
        post  :create , category: {name:"sports"}   # post s roca vaketebt create action istvis es misamartdeba categories_path tan (ar gvaq admin useri)
     end

  
  assert_redirected_to categories_path 
  end  
  
end