Given /^there is a kata created by "(.*)" with title "(.*)" in the language "(.*)"$/ do |author, title, language|
  if author == "me"
    user = current_user
  else
    user = User.new :email => author, :password => '1234', :password_confirmation => '1234'
  end
  Kata.transaction do
    Kata.new(:author => user, :title => title, :language => language).save
  end
end

Given /^I am on the katas page$/ do
  visit '/katas'
end

Then /^I should see the kata "(.*)" by "(.*)" in "(.*)"$/ do |title, author, language|
  author = current_user.email if author == "me"
  response.should have_tag("div#katas .kata") do
    with_tag "h2", title
  end
  response.should have_tag("div#katas .kata") do
    with_tag ".author", "Author: #{author}"
  end
 response.should have_tag("div#katas .kata") do
    with_tag ".language", "Language: #{language}"
  end
end

def current_user
  session = UserSession.find
  session.should_not be_nil
  session.user.should_not be_nil
  session.user
end
