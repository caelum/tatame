class DojosController < ApplicationController
  before_filter :require_login, :except => [:index]
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
    @dojo.retrospective = Retrospective.new
    if @dojo.save
      flash[:notice] = "Successfully created"
      redirect_to root_url
    else
      render :action => "new"
    end
  end
  
  def destroy
    @dojo = Dojo.find(params[:id])
    @dojo.participants.each { |p|
      p.destroy
    }
    @dojo.destroy
    flash[:notice] = "Successfully deleted"
    
    redirect_to root_url
  end
end
