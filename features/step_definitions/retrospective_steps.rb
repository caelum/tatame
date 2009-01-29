Given /^the dojo (\d+) days past has a retrospective$/ do |n|
  dojo = Dojo.find(:first, :conditions => ['date == ?', today - n.to_i.days])
  dojo.should_not be_nil
  dojo.retrospective.should_not be_nil
  dojo.retrospective.dojo_title = 'A mock title'
  Retrospective.transaction do
    dojo.retrospective.save
  end
end

Then /^I should see a dojo (\d+) days past with retrospective$/ do |n|
  date = (today - n.to_i.days).strftime("%Y-%m-%d - %H:%M")
  response.should have_tag("div#past_dojos") do
    with_tag("ol") do
      with_tag("li") do
        with_tag("span#date", "#{date}")
        with_tag("div#retrospective")
        without_tag("span#add")
      end
    end
  end
end

def today
  Time.utc(Time.now.year, Time.now.month, Time.now.day, 19, 0)
end
