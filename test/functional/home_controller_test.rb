require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "a non-authenticated user should get the home page" do
    get :index
    assert_response :success
  end

  test "an authenticated user should get the home page" do
    user = fake_user
    login_as(user)

    get :index
    assert_response :success
    assert_equal user, assigns(:current_user)
  end

  protected
    def fake_user
      User.create({
        :first_name => 'Admin',
        :last_name => 'McGee',
        :email => 'admin@example.com',
        :password => 'test123',
        :password_confirmation => 'test123'
      }, :without_protection => true)
    end
end