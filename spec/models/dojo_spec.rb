require File.dirname(__FILE__) + '/../spec_helper'

module DojoSpecHelper
  def valid_dojo_attributes
    { :date => Time.now + 24 * 60 * 60,
      :time => Time.now,
      :comment => "This is a test" }
  end
end

describe Dojo do
  include DojoSpecHelper
  
  before(:each) do
    @dojo = Dojo.new
  end
  
  it "should be valid" do
    @dojo.attributes = valid_dojo_attributes
    @dojo.should be_valid
  end
  
  it "should require date" do
    @dojo.attributes = valid_dojo_attributes.except(:date)
    @dojo.should_not be_valid
    @dojo.errors.on(:date).should eql("can't be blank")
    @dojo.date = Time.now + 24 * 60 * 60
    @dojo.should be_valid
  end
  
  it "should require time" do
    @dojo.attributes = valid_dojo_attributes.except(:time)
    @dojo.should_not be_valid
    @dojo.errors.on(:time).should eql("can't be blank")
    @dojo.time = Time.now
    @dojo.should be_valid
  end
end