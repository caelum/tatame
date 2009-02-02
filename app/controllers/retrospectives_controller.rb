class RetrospectivesController < ApplicationController
  before_filter :require_login

  def edit
    @retrospective = Retrospective.find(:first, :conditions => ["dojo_id = ?", params[:dojo_id]])
    @dojo = Dojo.find(params[:dojo_id]) 
  end
  
  def update
    @retrospective = Retrospective.find(:first, :conditions => ["dojo_id = ?", params[:dojo_id]])
    if @retrospective.update_attributes(params[:retrospective])
      redirect_to root_url
    else
      render :action => :edit
    end
  end
end
