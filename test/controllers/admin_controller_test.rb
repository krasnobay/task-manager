require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    email = generate(:string) + '@' + generate(:string)
    password = generate(:string)
    user = create(:user, {email: email, password: password})
    get admin_user_url(user)
    assert_response :success
  end
end
