class ParticipantsController < ApplicationController
  def create
    @participant = Participant.new(params[:participant])
    @participant.save
    redirect_to root_url
  end
  
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
    redirect_to root_url
  end
end