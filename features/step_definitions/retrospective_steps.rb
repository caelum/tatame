Given /^the dojo (\d+) days past has a retrospective$/ do |n|
  dojo = Dojo.find(:first, :conditions => ['date == ?', today - n.to_i.days])
  dojo.should_not be_nil
  dojo.retrospective.should_not be_nil
  dojo.retrospective.dojo_title = 'A mock title'
  Retrospective.transaction do
    dojo.retrospective.save
  end
end

Given /^the dojo (\d+) days past has (\d+) participants$/ do |n, p|
  dojo = Dojo.find(:first, :conditions => ['date == ?', today - n.to_i.days])
  id = dojo.id
  p.to_i.times do |i|
    mp = Participant.new
    mp.name = "Participant #{i+1}"
    mp.dojo_id = id
    mp.save  end  
  Retrospective.transaction do
    dojo.retrospective.save
  end
end

Then /^I should see a dojo (\d+) days past with retrospective$/ do |n|
  retrospectives = Retrospective.find(:all)
  possible_dojos = []
  dojo_date = today - n.to_i.days
  date = dojo_date.strftime "%d-%m-%Y - %H:%M"
  retrospectives.each do |retro|
    if !retro.blank? && retro.dojo.date == dojo_date
      possible_dojos << retro.dojo
    end
  end
  possible_dojos.should_not be_empty
  response.should have_tag("div#past_dojos") do
    with_tag("ol") do
      with_tag("li#dojo_#{possible_dojos[0].id}") do
        with_tag("span.date", "#{date}")
        with_tag("div.retrospective")
        without_tag("span.add")
      end
    end
  end
end

def today
  Time.local(Time.now.year, Time.now.month, Time.now.day, 19, 0)
end
