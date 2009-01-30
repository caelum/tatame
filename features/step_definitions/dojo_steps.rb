Given /I am on the new dojo page/ do
  visit "/dojos/new"
end

Given /I am on the randoris page/ do
  visit "/randoris/"
end

Given /there are (\d+) dojos scheduled starting in ([-]{0,1}\d+) days/ do |n, offset|
  Dojo.transaction do
    Dojo.destroy_all
    n.to_i.times do |n|
      Dojo.create! :date => today + (n.to_i + offset.to_i).days
    end
  end
end

Given /there are (\d+) past dojos/ do |n|
  Dojo.transaction do
    Dojo.destroy_all
    n.to_i.times do |n|
      Dojo.create! :date => today - 1.day - (n.to_i).days, :retrospective => Retrospective.new
    end
  end
end

Given /^there is no scheduled dojo$/ do
  Dojo.transaction do
    Dojo.destroy_all
  end
end

When /I delete the first dojo/ do
  visit dojos_url
  clicks_link "Destroy"
end

When /^I select ([-]{0,1}\d+) days from now as the date and time$/ do |n|
  datetime = today + n.to_i.days
  select_datetime(datetime)
end

When /^I am on the root page$/ do
  visit root_url
end

When /^I create a dojo with no date$/ do
  visit "/dojos/create"
end

When /^I create a participant with no dojo_id$/ do
  visit "/participants/create"
end

When /I visit the new dojo page/ do
  visit "/dojos/new"
end


Then /there should be (\d+) dojos left/ do |n|
  Dojo.count.should == n.to_i
  response.should have_tag("table tr", n.to_i + 1) # There is a header row too
end

Then /^I should see an empty (.+) list$/ do |id|
  response.should have_tag("div##{id}") do
    with_tag("ul") do
      without_tag("li")
    end
  end
end

Then /^the next dojo should be in (\d+) days$/ do |n|
  response.should have_tag("div#next") do
    date = (today + n.to_i.days).strftime("%Y-%m-%d - %H:%M")
    with_tag("span.date", "#{date}")
  end
end

Then /^the next dojo (\w+) should be "(.*)"$/ do |id, item|
  response.should have_tag("div") do
    with_tag("p.#{id}", "#{item}") or with_tag("span.#{id}", "#{item}")
  end
end

Then /^I should see a dojo in (\d+) days inside the schedule tag$/ do |n|
  response.should have_tag("div#schedule") do
    with_tag("ol") do
      date = (today + n.to_i.days).strftime("%Y-%m-%d - %H:%M")
      with_tag("li") do
        with_tag("span.date", "#{date}")
      end
    end
  end
end

Then /^I should see a dojo (\d+) days past$/ do |n|
  response.should have_tag("div#past_dojos") do
    with_tag("ol") do
      date = (today - n.to_i.days).strftime("%Y-%m-%d - %H:%M")
      with_tag("li") do
        with_tag("span.date", "#{date}")
      end
    end
  end
end

def today
  Time.utc(Time.now.year, Time.now.month, Time.now.day, 19, 0)
end
