class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def login
  end

  def create
    user = User.create(user_params)
    redirect_to root_path
  end

  def edit
    authenticate!
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_profile_path
  end

  def profile
    authenticate!
    @user = current_user
    render layout: 'profile_layout'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
