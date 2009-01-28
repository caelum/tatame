class RandorisController < ApplicationController
  layout 'simple'
  
  def index
    @randoris = Randori.find(:all)
  end
  def new
    if current_user
      @randori = Randori.new
    else
      flash[:notice] = "You must be logged in to do this"
      redirect_to root_path
    end
  end
  def create
    if current_user
      @randori = Randori.new(params[:randori])
      if @randori.save
        redirect_to randoris_path
      else
        render :action => :new
      end
    else
      flash[:notice] = "You must be logged in to do this"
      redirect_to root_path
    end
  end
  def destroy
    if current_user
      @randori = Randori.find(params[:id])
      @randori.destroy

      redirect_to randoris_path
    else
      flash[:notice] = "You must be logged in to do this"
      redirect_to root_path
    end
  end
  def edit
    if current_user
      @randori = Randori.find(params[:id])
    else
      flash[:notice] = "You must be logged in to do this"
      redirect_to root_path
    end
  end
  def update
    if current_user
      @randori = Randori.find(params[:id])
      if @randori.update_attributes(params[:randori])
        redirect_to randoris_path
      else
        render :action => :edit
      end
    else
      flash[:notice] = "You must be logged in to do this"
      redirect_to root_path
    end
  end
end
