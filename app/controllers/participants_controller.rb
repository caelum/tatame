class ParticipantsController < ApplicationController
  def create
    @participant = Participant.new(params[:participant])
    @participant.dojo_id = params[:dojo_id]
    if @participant.save
      flash[:notice] = "Successfully added"
    else
      flash[:notice] = "Empty name"
    end
    redirect_to root_url
  end
  
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
    flash[:notice] = "Successfully removed"
    redirect_to root_url
  end
end