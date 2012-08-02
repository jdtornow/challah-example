require 'test_helper'

class RegistrationControllerTest < ActionController::TestCase
  test "a non-auth user should get the registration form" do
    get :new
    assert_response :success
  end

  test "a logged in user should not get the registration form" do
    login_as(fake_user)

    get :new
    assert_redirected_to root_path
  end

  test "a non-authed user should be able to register" do
    assert_difference 'User.count', 1 do
      post :create, :user => { :first_name => 'john', :last_name => 'doe', :email => 'test@example.com', :password => 'test123', :password_confirmation => 'test123' }
    end

    assert_redirected_to root_path
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
