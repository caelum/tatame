class UserSessionsController < ApplicationController
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Welcome, #{@user_session.email}"
    else
      @user_session.destroy
      flash[:notice] = "Login failed"
    end
    redirect_to :back
  end
  
  def destroy
    user_session = current_user_session
    user_session.destroy unless user_session == nil
    flash[:notice] = "You have logged out"
    redirect_to root_url
  end
end
