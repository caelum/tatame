require File.dirname(__FILE__) + '/../spec_helper'

describe UserSessionsController do
  before do
    @user_session = mock_model(UserSession)
    @user_session.stub!(:email).and_return('my@email.com')
  end
  it "should save a valid user session and redirect to the main page" do
    UserSession.should_receive(:new).once.with(params[:user_session]).and_return(@user_session)
    @user_session.should_receive(:save).once.and_return(true)

    post 'create'
    assigns[:user_session].should == @user_session
    response.should redirect_to(root_path)
  end
  it "should not save an invalid user session" do 
    UserSession.should_receive(:new).once.with(params[:user_session]).and_return(@user_session)
    @user_session.should_receive(:save).once.and_return(false)

    post 'create'
    assigns[:user_session].should == @user_session
    response.should_not redirect_to(root_path)

  end
end
