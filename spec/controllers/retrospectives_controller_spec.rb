require File.dirname(__FILE__) + '/../spec_helper'

describe RetrospectivesController do
  before do
    @retro = mock_model(Retrospective)
    @dojo = mock_model(Dojo)
    @user_session = mock_model(UserSession)
    @user = mock_model(User)
    @user_session.stub!(:user).and_return(@user)
    @participant = mock_model(Participant)
    @participant_list = [@participant]
  end
  it "should load a created retrospective when logged in" do
    UserSession.stub!(:find).and_return(@user_session)
    Retrospective.should_receive(:find).once.with(:first, :conditions => ["dojo_id = ?", params[:dojo_id]]).and_return @retro
    Dojo.should_receive(:find).once.with(params[:dojo_id]).and_return @dojo
    Participant.should_receive(:find).once.with(:all, :conditions => ["dojo_id = ?", params[:dojo_id]])
    
    get 'edit'
    assigns[:retrospective].should == @retro
  end
  it "should not load a created retrospective when not logged in" do
    UserSession.stub!(:find).and_return(nil)

    get 'edit'
    response.should redirect_to(root_path)
    flash[:notice].should include("must be logged in")
  end
  
  it "should update a retrospective when logged in" do
    UserSession.stub!(:find).and_return(@user_session)
    Retrospective.should_receive(:find).once.with(:first, :conditions => ["dojo_id = ?", params[:dojo_id]]).and_return @retro
    Participant.should_receive(:find).with(:all, :conditions => ["dojo_id = ?", params[:dojo_id]]).and_return @participant_list
    @participant_list.should_receive(:each)
    params[:participants].stub!(:each)
    @retro.should_receive(:update_attributes).once.with(params[:retrospective]).and_return(true)
    
    put 'update'
    response.should redirect_to(root_path)
  end
  
  it "should not update a retrospective when not logged in" do
    UserSession.stub!(:find).and_return(nil)

    put 'update'
    response.should redirect_to(root_path)
    flash[:notice].should include("must be logged in")
  end
end
