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
end
