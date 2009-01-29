require File.dirname(__FILE__) + '/../spec_helper'

describe RetrospectivesController do
  before do
    @retro = mock_model(Retrospective)
    @user_session = mock_model(UserSession)
    @user = mock_model(User)
    @user_session.stub!(:user).and_return(@user)
  end
  it "should load a created retrospective when logged in" do
    UserSession.stub!(:find).and_return(@user_session)
    Retrospective.should_receive(:find).once.with(params[:id]).and_return @retro
    
    get 'edit'
    assigns[:retrospective].should == @retro
  end
  it "should not load a created retrospective when not logged in" do
    UserSession.stub!(:find).and_return(nil)

    get 'edit'
    response.should redirect_to(root_path)
    flash[:notice].should include("must be logged in")
  end
end
