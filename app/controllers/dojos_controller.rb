class DojosController < ApplicationController
  def index
    @dojos = Dojo.find(:all)
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