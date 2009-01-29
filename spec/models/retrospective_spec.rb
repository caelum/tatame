require File.dirname(__FILE__) + '/../spec_helper'

describe Retrospective do
  before do
    @retro = Retrospective.new
  end

  it "should require a dojo" do
    @retro.should_not be_valid
    @retro.errors.on(:dojo_id).should include("not a number")
    @retro.dojo_id = 1
    @retro.should be_valid
  end
  
  it "should be empty" do
    @retro.should be_empty  end
  
  it "should not be empty if an attribute is set" do
    @retro.should be_empty
    attrs = @retro.attribute_names - ['id', 'dojo_id', 'created_at', 'updated_at']
    attrs.collect! {|attr| attr + "="}
    attrs.each do |attr|
      @retro.send attr, "An enlightening string"
      @retro.should_not be_empty
      @retro.send attr, nil
      @retro.should be_empty
    end  end
end
