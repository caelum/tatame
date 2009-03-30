Then /^I should see my login in the kata's list$/ do
  session = UserSession.find
  session.should_not be_nil
  session.user.should_not be_nil
  session.user.email.should_not be_nil
  response.should have_tag("div#katas") do
    with_tag("p.author", "Author: #{session.user.email}")
  end
end
