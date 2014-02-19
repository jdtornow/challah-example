class RegistrationController < ApplicationController

  before_filter :check_for_existing_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      Challah::Session.create!(@user, request, params)
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  protected

  def check_for_existing_user
    if signed_in?
      redirect_to root_path and return
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
