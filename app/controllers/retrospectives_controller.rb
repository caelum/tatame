class RetrospectivesController < ApplicationController
  before_filter :require_login

  def edit
    @retrospective = Retrospective.find(:first, :conditions => ["dojo_id = ?", params[:dojo_id]])
    @dojo = Dojo.find(params[:dojo_id])
    @participants = Participant.find(:all, :conditions => ["dojo_id = ?", params[:dojo_id]])
    @participant = Participant.new 
  end
  
  def update
    @retrospective = Retrospective.find(:first, :conditions => ["dojo_id = ?", params[:dojo_id]])
    
    participants = Participant.find :all, :conditions => ["dojo_id = ?", params[:dojo_id]]
    participants.each do |p|
      p.was_present = false
      p.save
    end if participants  
    
    params[:participants].each do |p_id|
      participant = Participant.find :first, :conditions => ["id = ?", p_id]
      participant.was_present = true
      participant.save
    end if params[:participants]
    
    if @retrospective.update_attributes(params[:retrospective])
      redirect_to root_url
    else
      render :action => :edit
    end
  end
end
