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
  
  it "should be blank" do
    @retro.should be_blank
  end
  
  it "should not be blank if an attribute is set" do
    @retro.should be_blank
    attrs = @retro.attribute_names - ['id', 'dojo_id', 'created_at', 'updated_at']
    attrs.collect! {|attr| attr + "="}
    attrs.each do |attr|
      @retro.send attr, "An enlightening string"
      @retro.should_not be_blank
      @retro.send attr, nil
      @retro.should be_blank
    end
  end
end
