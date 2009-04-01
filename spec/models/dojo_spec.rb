require File.dirname(__FILE__) + '/../spec_helper'

module DojoSpecHelper
  def valid_dojo_attributes
    { :date => Time.now + 1.days,
      :block_list_date => Time.now + 1.days,
      :comment => "This is a test" }
  end
end

describe Dojo do
  include DojoSpecHelper
  
  before(:each) do
    @date = Time.now
    Time.stub!(:now).and_return(@date)
    
    @dojo = Dojo.new
  end
  
  it "should say the new date when there is no dojo yet" do
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
    
    Dojo.next_date.should == date + 7.days
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

  it "should require a block list date" do
    @dojo.attributes = valid_dojo_attributes.except :block_list_date
    @dojo.should_not be_valid
    @dojo.errors.on(:block_list_date).should include("can't be blank")
    @dojo.block_list_date = Time.now + 1.days
    @dojo.should be_valid
  end
  
  it "should relate to participants" do
    Dojo.reflect_on_association(:participants).should_not be_nil
  end

  it "should relate to a retrospective" do
    Dojo.reflect_on_association(:retrospective).should_not be_nil
  end

  it "should block its participant list when the block list date and time is before now and the dojo has not happened yet" do
    @dojo.attributes = valid_dojo_attributes
    @dojo.block_list_date = @date - 1.days
    @dojo.block_list?.should be_true
  end

  it "should not block its participant list when the block list date and time is after now" do
    @dojo.attributes = valid_dojo_attributes
    @dojo.block_list_date = @date + 1.days
    @dojo.block_list?.should_not be_true
  end

  it "should return the next dojo when there is a dojo scheduled" do
    Dojo.should_receive(:find) do |*args|
      options = args.pop
      options.should_not be_nil
      options.should be_kind_of(Hash)
      options.should have_key(:conditions)
      options[:conditions].should be_kind_of(Array)
      options[:conditions][0].should == "date > ?"
      options[:conditions][1].should == Time.now
      options.should have_key(:order)
      options[:order].should == "date ASC"
      @dojo
    end

    Dojo.next.should == @dojo
  end

  it "should not block its participant list when the block list date and time is before now and the dojo has already happened yet" do
    @dojo.attributes = valid_dojo_attributes
    @dojo.date = @date - 1.days
    @dojo.block_list_date = @date - 1.days
    @dojo.block_list?.should be_false
  end

end
