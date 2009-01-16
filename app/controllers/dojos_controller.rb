class DojosController < ApplicationController  
  def index
    @dojos = Dojo.find(:all, :conditions => ["date > ?", Time.now], :order => "date ASC")
    @dojo = @dojos.shift
    
    if @dojo != nil
      @participant = Participant.new
      @participant.dojo_id = @dojo.id
    end
  end
  
  def new
    @dojo = Dojo.new
    @dojo.date = Dojo.next_date
  end
  
  def create
    @dojo = Dojo.new(params[:dojo])
    if @dojo.save
      redirect_to root_url
    else
      render :action => "new"
    end
  end
  
  def destroy
    @dojo = Dojo.find(params[:id])
    @dojo.destroy
    redirect_to root_url
  end
end