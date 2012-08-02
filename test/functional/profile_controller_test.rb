require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "a non authenticated user should not be able to edit a profile" do
    get :edit
    assert_redirected_to signin_path
  end

  test "a signed-in user should have a user profile page" do
    user = fake_user

    login_as(user)

    get :edit
    assert_response :success
    assert_equal user, assigns(:user)
  end

  test "a signed-in user should update their profile" do
    user = fake_user

    login_as(user)

    put :update, :id => user.to_param, :user => { :first_name => 'Bob' }

    assert_redirected_to profile_path
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