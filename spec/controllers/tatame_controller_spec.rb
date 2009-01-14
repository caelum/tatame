require File.dirname(__FILE__) + '/../spec_helper'

describe TatameController do

  before(:each) do
    @dojos = mock_model(Dojo)
  end
  
  it "should list all dojos" do
    Dojo.should_receive(:find).once.with(:all).and_return(@dojos)
    
    get 'index'
    assigns[:dojos].should equal(@dojos)
  end
end