class UserSessionsController < ApplicationController
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Welcome, #{@user_session.email}"
      redirect_to root_path
    else
      redirect_to request.request_uri
    end
  end
end
