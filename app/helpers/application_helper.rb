# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_date(date)
    date.strftime("%d-%m-%Y - %H:%M")
  end
end
