require File.dirname(__FILE__) + '/../spec_helper'

module DojoSpecHelper
  def valid_dojo_attributes
    { :date => Time.now + 1.days,
      :comment => "This is a test" }
  end
end

describe Dojo do
  include DojoSpecHelper
  
  before(:each) do
    @date = mock_model(Time)
    @dojo = mock_model(Dojo)
    @dojo.stub!(:date).and_return(@date)
    @date.stub!(:+).and_return(@date)
    @date.stub!(:-).with(7.days).and_return(@date)
    Time.stub!(:now).and_return(@date)
    
    @dojo = Dojo.new
  end
  
  it "should say the new date when there is no dojo yet" do
    @date.stub!(:year).and_return(2009)
    @date.stub!(:month).and_return(01)
    @date.stub!(:day).and_return(22)
    Time.stub!(:gm).and_return(@date)
    Dojo.should_receive(:find) do |*args|
      options = args.shift
      options.should_not be_nil
      options.should == :first
      options = args.shift
      options.should be_kind_of(Hash)
      options.should have_key(:conditions)
      options[:conditions].should be_kind_of(Array)
      options[:conditions][0].should == "date > ?"
      options[:conditions][1].should == Time.now - 7.days
      options.shift
      options.should be_kind_of(Hash)
      options.should have_key(:order)
      options[:order].should == "date DESC"
      nil
    end
    date = Time.gm(Time.now.year, Time.now.month, Time.now.day, 19, 0)
    
    Dojo.next_date.should == date + 7.days
  end
  
  it "should say the new date when there is a dojo created recently" do
    Dojo.should_receive(:find) do |*args|
      options = args.pop
      options.should_not be_nil
      options.should be_kind_of(Hash)
      options.should have_key(:conditions)
      options[:conditions].should be_kind_of(Array)
      options[:conditions][0].should == "date > ?"
      options[:conditions][1].should == Time.now - 7.days
      options.should have_key(:order)
      options[:order].should == "date DESC"
      @dojo
    end
    date = Time.now
    
    @dojo.should_receive(:date).and_return(date)
    
    Dojo.next_date.should equal(date + 7.days)
  end
  
  it "should be valid" do
    @dojo.attributes = valid_dojo_attributes
    @dojo.should be_valid
  end
  
  it "should require date" do
    @dojo.attributes = valid_dojo_attributes.except(:date)
    @dojo.should_not be_valid
    @dojo.errors.on(:date).should include("can't be blank")
    @dojo.date = Time.now + 1.days
    @dojo.should be_valid
  end
  
  it "should relate to participants" do
    Dojo.reflect_on_association(:participants).should_not be_nil
  end
end
