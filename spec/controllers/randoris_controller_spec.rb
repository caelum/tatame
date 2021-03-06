require File.dirname(__FILE__) + '/../spec_helper'

describe RandorisController do
  before(:each) do
    @randori = mock_model(Randori)
    @randoris = mock_model(Randori)
    @user_session = mock_model(UserSession)
    @user = mock_model(User)
    @user_session.stub!(:user).and_return(@user)
  end
  
  it "should make a new randori if an user is authenticated" do
    Randori.should_receive(:new).once.and_return(@randori)
    UserSession.stub!(:find).and_return(@user_session)

    post 'new'
    assigns[:randori].should equal(@randori)
  end
  
  it "should not make a new randori if no user is authenticated" do
    UserSession.stub!(:find).and_return(nil)

    post 'new'
    response.should redirect_to(root_path)
    flash[:notice].should include("must be logged in")
  end
  
  it "should list all randoris" do
    Randori.should_receive(:find).once.with(:all).and_return(@randoris)
    get 'index'
    assigns[:randoris].should equal(@randoris)
  end
  
  it "should save a randori and redirect to the randoris page if logged in" do
    Randori.should_receive(:new).once.with(params[:randori]).and_return(@randori)
    @randori.should_receive(:save).once.and_return(true)
    UserSession.stub!(:find).and_return @user_session

    post 'create'
    assigns[:randori].should equal(@randori)
    response.should redirect_to(randoris_path)
  end
  
  it "should not save a randori if not logged in" do
    UserSession.stub!(:find).and_return nil

    post 'create'
    response.should redirect_to(root_path)
    flash[:notice].should include("must be logged in")
  end
  it "should delete a randori and redirect to the randoris page if logged in" do
    Randori.should_receive(:find).once.with(params[:id]).and_return(@randori)
    @randori.should_receive(:destroy).once
    UserSession.stub!(:find).and_return @user_session

    post 'destroy'
    response.should redirect_to(randoris_path)
  end

  it "should not delete a randori if not logged in" do
    UserSession.stub!(:find).and_return nil

    post 'destroy'
    response.should redirect_to(root_path)
    flash[:notice].should include("must be logged in")
  end
  
  it "should edit a randori if logged in" do
    Randori.should_receive(:find).once.with(params[:id]).and_return(@randori)
    UserSession.stub!(:find).and_return @user_session

    get 'edit'
    assigns[:randori].should equal(@randori)
  end

  it "should not edit a randori when not logged in" do
    UserSession.stub!(:find).and_return nil

    get 'edit'
    response.should redirect_to(root_path)
    flash[:notice].should include("must be logged in")
  end
  
  it "should update a randori and redirect to the randoris page if logged in" do
    Randori.should_receive(:find).once.with(params[:id]).and_return(@randori)
    @randori.should_receive(:update_attributes).once.with(params[:randori]).and_return(true)
    UserSession.stub!(:find).and_return @user_session

    put 'update'
    response.should redirect_to(randoris_path)
  end

  it "should not update a randori when not logged in" do
    UserSession.stub!(:find).and_return nil

    put 'update'
    response.should redirect_to(root_path)
    flash[:notice].should include("must be logged in")
  end

  it "should return to the new page when creating an invalid randori" do
    Randori.should_receive(:new).once.with(params[:randori]).and_return(@randori)
    @randori.should_receive(:save).once.and_return(false)
    UserSession.stub!(:find).and_return @user_session

    post 'create'
    assigns[:randori].should equal(@randori)
    response.should_not redirect_to(randoris_path)
  end
  
  it "should return to the edit page when making an invalid edit to an existing randori" do
    Randori.should_receive(:find).once.with(params[:id]).and_return(@randori)
    @randori.should_receive(:update_attributes).with(params[:randori]).once.and_return(false)
    UserSession.stub!(:find).and_return @user_session
  
    put 'update'
    assigns[:randori].should equal(@randori)
    response.should_not redirect_to(randoris_path)
  end
end
