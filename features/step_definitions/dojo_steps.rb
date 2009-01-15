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
  visit dojos_url
  clicks_link "Destroy"
end

Then /there should be (\d+) dojos left/ do |n|
  Dojo.count.should == n.to_i
  response.should have_tag("table tr", n.to_i + 1) # There is a header row too
end

Then /^the next dojo (\w+) should be "(.*)"$/ do |id, item|
  response.should have_tag("div") do
    with_tag("span##{id}", "#{item}")
  end
end

Then /^I should see an empty presence list$/ do
  response.should have_tag("div") do
    with_tag("ul") do
      without_tag("li")
    end
  end
end

Given /^there is a dojo scheduled for tomorrow$/ do
  Dojo.transaction do
    Dojo.destroy_all
    Dojo.create! :date => Time.now + 1.days
  end
end

Then /^the next dojo date should be tomorrow$/ do
  response.should have_tag("div#next") do
    date = (Time.now + 1.days).strftime("%Y-%m-%d - %H:%M")
    with_tag("span#date", "#{date}")
  end
end

Then /^I should see a dojo scheduled to the day after tomorrow$/ do
  response.should have_tag("div#schedule") do
    with_tag("ol") do
      date = (Time.now + 2.days).strftime("%Y-%m-%d - %H:%M")
      with_tag("li", "#{date}")
    end
  end
end

When /^I select tomorrow as the "(.*)" date and time$/ do |datetime_label|
  datetime = Time.now + 1.days
  select_datetime(datetime, :from => datetime_label)
end

When /^I select day after tomorrow as the "(.*)" date and time$/ do |datetime_label|
  datetime = Time.now + 2.days
  select_datetime(datetime, :from => datetime_label)
end

When /^I am on the root page$/ do
  visit root_url
end

Given /^There is no scheduled dojo$/ do
  Dojo.transaction do
    Dojo.destroy_all
  end
end


