require File.dirname(__FILE__) + '/../spec_helper'

module RandoriSpecHelper
  def valid_randori_attributes
    { :title => 'A title',
      :description => 'Some description' }
  end
end

describe Randori do
  include RandoriSpecHelper

  before :each do
    @randori = Randori.new
  end
  it "should be valid" do
    @randori.attributes = valid_randori_attributes
    @randori.should be_valid
  end
  it "should be valid without description" do
    @randori.attributes = valid_randori_attributes.except(:description)
    @randori.should be_valid
  end
  it "should not be valid without title" do
    @randori.attributes = valid_randori_attributes.except(:title)
    @randori.should_not be_valid
  end
end
