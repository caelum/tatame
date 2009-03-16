require File.dirname(__FILE__) + '/../spec_helper'

describe UserSessionsController do
  before do
    @user_session = mock_model(UserSession)
    @user_session.stub!(:email).and_return('my@email.com')
    request.env['HTTP_REFERER'] = 'http://www.example.com/'
  end
  it "should save a valid user session and redirect to the origin page" do
    UserSession.should_receive(:new).once.with(params[:user_session]).and_return(@user_session)
    @user_session.should_receive(:save).once.and_return(true)

    post 'create'
    assigns[:user_session].should == @user_session
    response.should redirect_to(:back)
  end

  it "should not save an invalid user session and show a message in the same page" do 
    UserSession.should_receive(:new).once.with(params[:user_session]).and_return(@user_session)
    @user_session.should_receive(:save).once.and_return(false)
    @user_session.should_receive(:destroy).once
   
    post 'create'
    assigns[:user_session].should == @user_session
    response.should redirect_to(:back)
  end
  
  it "should loggout when logged in" do
    UserSession.stub!(:find).and_return(@user_session)
    @user_session.should_receive(:destroy).once
    
    post 'destroy'
    response.should redirect_to(root_url)  end
end
