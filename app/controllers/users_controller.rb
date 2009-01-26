class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    @user.save

    flash[:notice] = "Welcome, #{@user.email}"
    redirect_to root_path
  end
end
