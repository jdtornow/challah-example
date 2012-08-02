require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test "a user should sign in and go to the home page by default" do
    user = fake_user

    # Start at the sign in
    get signin_path
    assert_response :success

    # Submit the login form
    post_via_redirect signin_path, :session => { :username => user.username, :password => 'test123' }

    # Then get redirected to the dashboard
    assert_equal root_path, path
    assert_equal user, assigns(:current_user)

    # Then log out
    get_via_redirect signout_path
    assert_equal signin_path, path
    assert_equal nil, assigns(:current_user)
  end

  test "a user should start at a page then redirect back to it after signing in" do
    user = fake_user

    get_via_redirect profile_path
    assert_equal signin_path, path

    # Submit the login form
    post_via_redirect signin_path, :session => { :username => user.username, :password => 'test123' }

    # Then get redirected to the page we wanted
    assert_equal profile_path, path
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
