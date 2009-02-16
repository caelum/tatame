require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationHelper do
  include ApplicationHelper
 
  it "should format date" do
    date = Time.now
    show_date(date).should == date.strftime("%d-%m-%Y - %H:%M")
  end
end
