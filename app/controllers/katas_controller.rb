class KatasController < ApplicationController
  layout 'simple'
  before_filter :require_login, :except => [:index]
  
  def index
    @katas = Kata.find(:all)
  end

  def new
    @kata = Kata.new
  end

  def create
    @kata = Kata.new(params[:kata])
    @kata.author = current_user
    if @kata.save
      redirect_to katas_url
    else
      render :action => :new
    end
  end
  
  def destroy
    @kata = Kata.find(params[:id])
    @kata.destroy

    redirect_to katas_path
  end 
  
  def edit
    @kata = Kata.find(params[:id])
  end
  
  def update
    @kata = Kata.find(params[:id])
    if @kata.update_attributes(params[:kata])
      redirect_to katas_path
    else
      render :action => :edit
    end
  end

end
