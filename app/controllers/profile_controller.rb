class ProfileController < ApplicationController
  restrict_to_authenticated

  # GET /profile
  def edit
    @user = current_user
  end

  # PUT /profile
  def update
    @user = current_user

    # Show that the last user that updated data was themself
    @user.current_user = current_user

    if @user.update_attributes(user_params)
      redirect_to profile_path, notice: 'Profile has been updated successfully.'
    else
      render action: 'edit'
    end
  end

  protected
    def user_params
      params[:user].slice(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end
end