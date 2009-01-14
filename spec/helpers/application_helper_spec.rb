require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationHelper do
  include ApplicationHelper
  
  it "should format time" do
    time = Time.now
    show_time(time).should == time.strftime("%H:%M")
  end
end