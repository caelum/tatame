class DojosController < ApplicationController  
  def index
    @dojos = Dojo.find(:all, :conditions => ["date > ?", Time.now], :order => "date ASC")
    @dojo = @dojos.shift
  end
  
  def new
    @dojo = Dojo.new
  end
  
  def create
    @dojo = Dojo.new(params[:dojo])
    if @dojo.save
      redirect_to root_url
    else
      render :action => "new"
    end
  end
end