Given /^I am not logged in$/ do
  session = UserSession.find
  session.destroy unless session == nil
end

Given /^there is an user registered as "(.*)"$/ do |email|
  User.transaction do
    User.new(:email => email, :password => '1234', :password_confirmation => '1234').save
  end
end

Then /^there should exist an user with email "(.*)"$/ do |email|
  user = User.find :first, :conditions => ["email = ?", email]
  user.should_not be_nil
end

Then /^I should be logged in as "(.*)"$/ do |email|
  session = UserSession.find
  session.should_not be_nil
  session.user.should_not be_nil
  session.user.email.should == email
end
