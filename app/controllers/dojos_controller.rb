class DojosController < ApplicationController  
  def index
    @dojos = Dojo.find(:all, :conditions => ["date > ?", Time.now], :order => "date ASC")
    @dojo = @dojos.first
    @dojos.delete_at(0)
  end
  
  def new
    @dojo = Dojo.new
  end
  
  def create
    @dojo = Dojo.new(params[:dojo])
    @dojo.save
    redirect_to root_url
  end
end