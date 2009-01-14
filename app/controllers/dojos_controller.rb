class DojosController < ApplicationController
  def create
    @dojo = Dojo.new(params[:dojo])
    @dojo.save
    redirect_to :action => "index"
  end
end