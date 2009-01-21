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
  def destroy
    @randori = Randori.find(params[:id])
    @randori.destroy

    redirect_to randoris_path
  end
  def edit
    @randori = Randori.find(params[:id])
  end
  def update
    @randori = Randori.find(params[:id])
    @randori.update_attributes(params[:randori])

    redirect_to randoris_path
  end
end
