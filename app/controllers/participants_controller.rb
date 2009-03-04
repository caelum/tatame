class ParticipantsController < ApplicationController
  def create
    dojo = Dojo.find params[:dojo_id]
    if dojo.block_list?
      flash[:notice] = "The dojo's participant list is blocked"
    else
      @participant = Participant.new(params[:participant])
      @participant.dojo_id = params[:dojo_id]
      if @participant.save
        flash[:notice] = "Successfully added participant #{@participant.name}"
      else
      flash[:notice] = "Empty name"
      end
    end
    redirect_url = request.env['HTTP_REFERER'] || root_url
    redirect_to redirect_url
  end
  
  def destroy
    @participant = Participant.find(params[:id])
    unless @participant.dojo.block_list?
      @participant.destroy
      flash[:notice] = "Successfully removed participant #{@participant.name}"
    end
    redirect_to root_url
  end
end
