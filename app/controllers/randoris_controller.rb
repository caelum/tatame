class RandorisController < ApplicationController
  def index
    @randoris = Randori.find(:all)
  end
  def new
    @randori = Randori.new
  end
  def create
    @randori = Randori.new(params[:randori])
    if @randori.save
      redirect_to randoris_path
    end
  end
end
