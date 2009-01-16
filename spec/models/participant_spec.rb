require File.dirname(__FILE__) + '/../spec_helper'

module ParticipantSpecHelper
  def valid_participant_attributes
    { :name => "caue",
      :dojo_id => 1 }
  end
end

describe Participant do
  include ParticipantSpecHelper
  
  before(:each) do
    @participant = Participant.new
  end
  
  it "should be valid" do
    @participant.attributes = valid_participant_attributes
    @participant.should be_valid
  end
  
  it "should require name" do
    @participant.attributes = valid_participant_attributes.except(:name)
    @participant.should_not be_valid
    @participant.errors.on(:name).should include("can't be blank")
    @participant.name = "caue"
    @participant.should be_valid
  end
  
  it "should require dojo_id" do
    @participant.attributes = valid_participant_attributes.except(:dojo_id)
    @participant.should_not be_valid
    @participant.errors.on(:dojo_id).should include("is not a number")
    @participant.dojo_id = 1
    @participant.should be_valid
  end
  
  it "should relate to dojo" do
    Participant.reflect_on_association(:dojo).should_not be_nil
  end
end