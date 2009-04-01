Given /^I am not logged in$/ do
  session = UserSession.find
  session.destroy unless session == nil
end

Given /^I am logged in$/ do
  create_user 'mock@mock.com'
  visit root_url
  fill_in :user_session_email, :with => 'mock@mock.com'
  fill_in :user_session_password, :with => '1234'
  click_button "Login"
end

Given /^there is an user registered as "(.*)"$/ do |email|
  create_user email
end

Then /^there should exist an user with email "(.*)"$/ do |email|
  user = User.find_by_email email
  user.should_not be_nil
end

Then /^I should be logged in as "(.*)"$/ do |email|
  session = UserSession.find
  session.should_not be_nil
  session.user.should_not be_nil
  session.user.email.should == email
end

def create_user email
  user = User.new :email => email, :password => '1234', :password_confirmation => '1234'
  User.transaction {user.save}
  user
end
