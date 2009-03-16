require File.dirname(__FILE__) + '/../spec_helper'

describe ParticipantsController do
  before(:each) do
    @participant = mock_model(Participant)
    @dojo = mock_model(Dojo)
  end
  
  it "should save the participant" do
    Dojo.should_receive(:find).once.with(params[:dojo_id]).and_return(@dojo)
    @dojo.should_receive(:block_list?).once.and_return(false)
    Participant.should_receive(:new).once.and_return(@participant)
    @participant.should_receive(:dojo_id=).once
    @participant.should_receive(:name).once
    @participant.should_receive(:save).once.and_return(true)
    
    post 'create'
    assigns[:participant].should equal(@participant)
    response.should redirect_to(root_url)
  end
  
  it "should delete a participant" do
    Participant.should_receive(:find).once.with(params[:id]).and_return(@participant)
    @participant.should_receive(:dojo).once.and_return(@dojo)
    @dojo.should_receive(:block_list?).once.and_return(false)
    @participant.should_receive(:destroy).once
    @participant.should_receive(:name)
    
    post 'destroy'
    response.should redirect_to(root_url)
  end
  
  it "should fail on validation errors" do
    Dojo.should_receive(:find).once.with(params[:dojo_id]).and_return(@dojo)
    @dojo.should_receive(:block_list?).once.and_return(false)
    Participant.should_receive(:new).once.and_return(@participant)
    @participant.should_receive(:dojo_id=).once
    @participant.should_receive(:save).once.and_return(false)
    
    post 'create'
    assigns[:participant].should equal(@participant)
    response.should redirect_to(root_url)
  end

  it "should not delete a participant when it is in a blocked list" do
    Participant.should_receive(:find).once.with(params[:id]).and_return(@participant)
    @participant.should_receive(:dojo).once.and_return(@dojo)
    @dojo.should_receive(:block_list?).once.and_return(true)

    post 'destroy'

  end

  it "should not add a participant to a blocked list" do
    Dojo.should_receive(:find).once.with(params[:dojo_id]).and_return(@dojo)
    @dojo.should_receive(:block_list?).once.and_return(true)

    post 'create'
    response.should redirect_to(root_url)
  end
end
