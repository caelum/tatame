# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_date(date)
    date.strftime("%Y-%m-%d - %H:%M")
  end
 
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
end
