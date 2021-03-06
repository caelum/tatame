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
      next_date = today + (n.to_i + offset.to_i).days
      Dojo.create! :date => next_date, :retrospective => Retrospective.new, :block_list_date => next_date
    end
  end
end

Given /there are (\d+) past dojos/ do |n|
  Dojo.transaction do
    Dojo.destroy_all
    n.to_i.times do |n|
      date = today - (1 + n.to_i).days
      Dojo.create! :date => date, :retrospective => Retrospective.new, :block_list_date => date
    end
  end
end

Given /^there is no scheduled dojo$/ do
  Dojo.transaction do
    Dojo.destroy_all
  end
end

Given %r{^the participant "(.*)" has confirmed his/her presence to the next Dojo$} do |name|
  visit "/"
  fill_in "participant_name", :with => name
  click_button "add_participant"
end

Given /^the participant list is blocked$/ do
  Dojo.transaction do
    dojo = Dojo.next
    dojo.update_attributes :block_list_date => today - 1.days
  end
end

When /I delete the first dojo/ do
  visit dojos_url
  clicks_link "Destroy"
end

When /^I select ([-]{0,1}\d+) days from now as the date and time for "(.*)"$/ do |n, property|
  datetime = today + n.to_i.days
  select_datetime(datetime, :from => property)
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
    date = (today + n.to_i.days).strftime("%d-%m-%Y - %H:%M")
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
      date = (today + n.to_i.days).strftime("%d-%m-%Y - %H:%M")
      with_tag("li") do
        with_tag("span.date", "#{date}")
      end
    end
  end
end

Then /^I should see a dojo (\d+) days past$/ do |n|
  response.should have_tag("div#past_dojos") do
    with_tag("ol") do
      date = (today - n.to_i.days).strftime("%d-%m-%Y - %H:%M")
      with_tag("li") do
        with_tag("span.date", "#{date}")
      end
    end
  end
end

Then /^I should see a box to put my name$/ do
  response.should have_tag("#participant_name")
end

Then /^I should not see a box to put my name$/ do
  response.should_not have_tag("#participant_name")
end

def today
  Time.local(Time.now.year, Time.now.month, Time.now.day, 19, 0)
end
