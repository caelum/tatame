Given /^there is a randori suggested with title "(.+?)"( and description "(.+?)")?$/ do |title, ignore, description|
  Randori.transaction do
    Randori.create! :title => title, :description => description
  end
end
