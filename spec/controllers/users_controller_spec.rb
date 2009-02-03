require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController do
  before :each do
    @user = mock_model(User)
    @user.stub!(:email).and_return("my@email.com")
  end

  it "should create a new user" do
    User.should_receive(:new).once.and_return(@user)

    get 'new'
    assigns[:user].should == @user
  end
  it "should save a valid user" do
    User.should_receive(:new).once.with(params[:user]).and_return(@user)
    @user.should_receive(:save).once.and_return(true)

    post 'create'
    assigns[:user].should == @user
    response.should redirect_to(root_path)
    flash[:notice].should == "Added user #{@user.email}"
  end
  it "should not save an invalid user" do
    User.should_receive(:new).once.with(params[:user]).and_return(@user)
    @user.should_receive(:save).once.and_return(false)

    post 'create'
    assigns[:user].should == @user
    response.should_not redirect_to(root_path)
 end
end
