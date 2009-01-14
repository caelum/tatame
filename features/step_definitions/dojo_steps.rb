Given /I am on the new dojo page/ do
  visit "/dojos/new"
end

Given /there are (\d+) dojos/ do |n|
  Dojo.transaction do
    Dojo.destroy_all
    n.to_i.times do |n|
      Dojo.create! :name => "Dojo #{n}"
    end
  end
end

When /I delete the first dojo/ do
  visits dojos_url
  clicks_link "Destroy"
end

Then /there should be (\d+) dojos left/ do |n|
  Dojo.count.should == n.to_i
  response.should have_tag("table tr", n.to_i + 1) # There is a header row too
end

Then /^the next dojo (\w+) should be "(.*)"/ do |id, item|
  response.should have_tag("div") do
    with_tag("span##{id}", "#{item}")
  end
end

Then /^I should see an empty presence list$/ do
  visit root_url
  
end
