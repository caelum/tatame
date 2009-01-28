require File.dirname(__FILE__) + '/../spec_helper'

describe DojosController do
  
  before(:each) do
    @dojo = mock_model(Dojo)
    @dojos = mock_model(Dojo)
    @dojos.stub!(:shift).and_return(@dojo)
    @date = mock_model(Time)
    @user_session = mock_model(UserSession)
    @user = mock_model(User)
  end
  
  it "should make a new dojo" do
    Dojo.stub!(:next_date).and_return(@date)
    Dojo.should_receive(:new).once.and_return(@dojo)
    @dojo.should_receive(:date=).once.with(@date).and_return(@date)
    
    post 'new'
    assigns[:dojo].should equal(@dojo)
  end
  
  it "should save the dojo and redirect to root_url if the user is authenticated" do
    Dojo.should_receive(:new).with(params[:dojo]).once.and_return(@dojo)
    UserSession.should_receive(:find).once.and_return(@user_session)
    @user_session.should_receive(:user).once.and_return(@user)
    @dojo.should_receive(:save).once.and_return(true)
    
    post 'create'
    assigns[:dojo].should equal(@dojo)
    response.should redirect_to(root_url)
  end

  it "should not save the dojo and should redirect to root_url if the user is not authenticated" do
    Dojo.should_receive(:new).with(params[:dojo]).once.and_return(@dojo)
    UserSession.should_receive(:find).once.and_return(@user_session)
    @user_session.should_receive(:user).once.and_return(nil)
    
    post 'create'
    response.should redirect_to(root_url)
  end
    
  it "should list all dojos" do
    date = Time.now
    Time.stub!(:now).and_return(date)
    Dojo.should_receive(:find).once.with(:all, :conditions => ["date > ?", date], :order => "date ASC").and_return(@dojos)
    get 'index'
    assigns[:dojos].should equal(@dojos)
    assigns[:dojo].should equal(@dojo)
  end
  
  it "should go back to the form on validation errors" do
    Dojo.should_receive(:new).once.and_return(@dojo)
    UserSession.should_receive(:find).once.and_return(@user_session)
    @user_session.should_receive(:user).once.and_return(@user)
    @dojo.should_receive(:save).once.and_return(false)
    
    post 'create'
    assigns[:dojo].should equal(@dojo)
    response.should render_template("dojos/new")
  end
    
  it "should delete a dojo without associated itens if user is authenticated" do
    Dojo.should_receive(:find).once.with(params[:id]).and_return(@dojo)
    UserSession.should_receive(:find).once.and_return(@user_session)
    @user_session.should_receive(:user).once.and_return(@user)
    @dojo.should_receive(:destroy).once
    
    post 'destroy'
    response.should redirect_to(root_url)
  end
  
  it "should not delete a dojo without associated itens if user is not authenticated" do
    UserSession.should_receive(:find).once.and_return(@user_session)
    @user_session.should_receive(:user).once.and_return(nil)
    
    post 'destroy'
    response.should redirect_to(root_url)
  end
  
  it "should be able to destroy dojos and associated itens"
end