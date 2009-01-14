class TatameController < ApplicationController  
  def index
    @dojos = Dojo.find(:all)
  end
end