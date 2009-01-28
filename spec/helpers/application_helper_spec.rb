require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationHelper do
  include ApplicationHelper
 
  before do
    @user = mock_model(User)
    @user_session = mock_model(UserSession)
    @user_session.stub!(:user).and_return(@user)
  end
 
  it "should format date" do
    date = Time.now
    show_date(date).should == date.strftime("%Y-%m-%d - %H:%M")
  end
  it "should give the user logged in when there is one" do
    UserSession.stub!(:find).and_return @user_session
    current_user_session.should_not be_nil
    current_user_session.user.should == @user
    current_user.should == @user
  end
  it "should give nil when there is no user logged in" do
    UserSession.stub!(:find).and_return nil
    current_user_session.should be_nil
    current_user.should be_nil
  end

end
