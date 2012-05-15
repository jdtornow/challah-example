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

    # Uses User#update_account_attributes to only update attributes that are
    # safe to change. (User can't update their own role
    if @user.update_account_attributes(params[:user])
      redirect_to profile_path, :notice => 'Profile has been updated successfully.'
    else
      render action: 'edit'
    end
  end
end