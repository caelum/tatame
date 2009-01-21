Given /^there is a randori suggested with title "(.+)"$/ do |title|
  Randori.transaction do
    Randori.create! :title => title
  end
end
