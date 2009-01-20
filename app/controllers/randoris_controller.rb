class RandorisController < ApplicationController
  def index
    @randoris = Randori.find(:all)
  end
  def new
    @randori = Randori.new
  end
end
