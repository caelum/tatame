Given /^there are (\d+) randoris suggested with title "(.+)"$/ do |n, title|
  Randori.transaction do
    Randori.destroy_all
    n.to_i.times do
      Randori.create! :title => title
    end
  end
end