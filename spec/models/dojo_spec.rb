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
    @int = mock_model(Integer)
    @dojo.stub!(:date).and_return(@date)
    @date.stub!(:+).and_return(@date)
    @date.stub!(:-).with(7.days).and_return(@date)
    Time.stub!(:now).and_return(@date)
    
    @dojo = Dojo.new
  end
  
  it "should say the new date when there is no dojo yet" do
    @date.stub!(:year).and_return(@int)
    @date.stub!(:month).and_return(@int)
    @date.stub!(:day).and_return(@int)
    Time.stub!(:gm).and_return(@date)
    Dojo.should_receive(:find) do |args|
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
    
    Dojo.next_date.should_not be_nil
  end
  
  it "should say the new date when there is a dojo created recently" do
    Dojo.should_receive(:find) do |args|
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
    @dojo.should_receive(:date).and_return(@date)
    
    Dojo.next_date.should_not be_nil
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