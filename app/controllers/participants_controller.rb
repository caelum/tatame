class ParticipantsController < ApplicationController
  def create
    @participant = Participant.new(params[:participant])
    @participant.dojo_id = params[:dojo_id]
    if @participant.save
      flash[:notice] = "Successfully added participant #{@participant.name}"
    else
    flash[:notice] = "Empty name"
    end
    redirect_url = request.env['HTTP_REFERER'] || root_url
    redirect_to redirect_url
  end
  
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
    flash[:notice] = "Successfully removed participant #{@participant.name}"
    redirect_to root_url
  end
end
