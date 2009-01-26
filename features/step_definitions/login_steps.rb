Given /^I am not logged in$/ do
  session = UserSession.find
  session.destroy unless session == nil
end

Then /^there should exist an user with email "(.*)"$/ do |email|
  user = User.find :first, :conditions => ["email = ?", email]
  user.should_not be_nil
end
