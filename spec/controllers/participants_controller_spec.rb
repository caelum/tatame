require File.dirname(__FILE__) + '/../spec_helper'

describe ParticipantsController do
  before(:each) do
    @participant = mock_model(Participant)
    @dojo = mock_model(Dojo)
    @user_session = mock_model(UserSession)
    @user = mock_model(User)
    @user_session.stub!(:user).and_return(@user)
  end
  
  it "should save the participant if logged in" do
    UserSession.stub!(:find).and_return(@user_session)
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
  
  it "should delete a participant if logged in" do
    UserSession.stub!(:find).and_return(@user_session)
    Participant.should_receive(:find).once.with(params[:id]).and_return(@participant)
    @participant.should_receive(:dojo).once.and_return(@dojo)
    @dojo.should_receive(:block_list?).once.and_return(false)
    @participant.should_receive(:destroy).once
    @participant.should_receive(:name)
    
    post 'destroy'
    response.should redirect_to(root_url)
  end
  
  it "should fail on validation errors" do
    UserSession.stub!(:find).and_return(@user_session)
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
    UserSession.stub!(:find).and_return(@user_session)
    Participant.should_receive(:find).once.with(params[:id]).and_return(@participant)
    @participant.should_receive(:dojo).once.and_return(@dojo)
    @dojo.should_receive(:block_list?).once.and_return(true)

    post 'destroy'

  end

  it "should not add a participant to a blocked list" do
    UserSession.stub!(:find).and_return(@user_session)
    Dojo.should_receive(:find).once.with(params[:dojo_id]).and_return(@dojo)
    @dojo.should_receive(:block_list?).once.and_return(true)

    post 'create'
    response.should redirect_to(root_url)
  end
  
  it "should not save the participant if not logged in" do
    UserSession.stub!(:find).and_return(nil)

  end
  
  it "should not delete a participant if not logged in" do
    UserSession.stub!(:find).and_return(nil)
  end
end
