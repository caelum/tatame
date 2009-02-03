class UsersController < ApplicationController
  layout 'simple'
  
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save

      flash[:notice] = "Added user #{@user.email}"
      redirect_to root_path
    else
      render :action => :new
    end
  end
end
