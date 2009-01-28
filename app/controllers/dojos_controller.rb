class DojosController < ApplicationController  
  def index
    @dojos = Dojo.find(:all, :conditions => ["date > ?", Time.now], :order => "date ASC")
    @dojo = @dojos.shift
    @participant = Participant.new
  end
  
  def new
    @dojo = Dojo.new
    @dojo.date = Dojo.next_date
  end
  
  def create
    @dojo = Dojo.new(params[:dojo])
    if defined?(current_user_session.user) && current_user_session.user
      if @dojo.save
        flash[:notice] = "Successfully created"
        redirect_to root_url
      else
        render :action => "new"
      end
    else
      flash[:notice] = "You are not logged in."
      redirect_to root_url
    end
  end
  
  def destroy
    @dojo = Dojo.find(params[:id])
    @dojo.destroy
    flash[:notice] = "Successfully deleted"
    redirect_to root_url
  end
end