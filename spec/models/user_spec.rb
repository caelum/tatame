require File.dirname(__FILE__) + '/../spec_helper' 

module UserSpecHelper
  def valid_user_attributes
    { :email => 'myemail@email.com',
      :password => 'avalidpassword' }
  end
end

describe User do
  include UserSpecHelper

  before :each do
    @user = User.new
  end

  it "should be valid" do
    @user.attributes = valid_user_attributes
    @user.should be_valid
  end

  it "should require password" do
    @user.attributes = valid_user_attributes.except :password
    @user.should_not be_valid
    @user.errors.on(:password).should include("can't be blank")
  end
  it "should require email" do
    @user.attributes = valid_user_attributes.except :email
    @user.should_not be_valid
    @user.errors.on(:email).should include("can't be blank")
  end
end
