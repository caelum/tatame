require File.dirname(__FILE__) + '/../spec_helper' 

module UserSpecHelper
  def valid_user_attributes
    { :email => 'myemail@email.com',
      :password => 'avalidpassword',
      :password_confirmation => 'avalidpassword'
    }
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
    @user.errors.on(:password).should include("too short")
  end
  it "should require email" do
    @user.attributes = valid_user_attributes.except :email
    @user.should_not be_valid
    @user.errors.on(:email).to_s.should include("too short")
  end
  it "should not allow two users with the same email" do
    another_user = User.new
    @user.attributes = valid_user_attributes
    another_user.attributes = valid_user_attributes
    @user.save
    another_user.should_not be_valid
    another_user.errors.on(:email).should include("already registered with this email")
  end
  it "should require password confirmation" do
    @user.attributes = valid_user_attributes.except :password_confirmation
    @user.should_not be_valid
    @user.errors.on(:password_confirmation).should include("can't be blank")
  end
  it "should verify that the password and the password confirmation are equal" do
    @user.attributes = valid_user_attributes.except :password_confirmation
    @user.password_confirmation = 'adifferentpassword'
    @user.should_not be_valid
    @user.errors.on(:password).should include("doesn't match confirmation")
  end
end
