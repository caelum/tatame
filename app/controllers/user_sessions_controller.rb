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
end
