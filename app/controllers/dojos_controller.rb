class DojosController < ApplicationController  
  def new
    @dojo = Dojo.new
  end
  
  def create
    @dojo = Dojo.new(params[:dojo])
    @dojo.save
    redirect_to root_url
  end
end