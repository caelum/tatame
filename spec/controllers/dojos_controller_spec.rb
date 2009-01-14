require File.dirname(__FILE__) + '/../spec_helper'

describe DojosController do
  
  before(:each) do
    @dojo = mock_model(Dojo)
    @dojos = mock_model(Dojo)
    #@dojo.stub!(:new_record?).and_return(true)
  end
  
  it "should make a new dojo" do
    Dojo.should_receive(:new).once.and_return(@dojo)
    
    post 'new'
    assigns[:dojo].should equal(@dojo)
  end
  
  it "should save the dojo and redirect to root_url" do
    Dojo.should_receive(:new).once.and_return(@dojo)
    @dojo.should_receive(:save).once.and_return(true)
    
    post 'create'
    assigns[:dojo].should equal(@dojo)
    response.should redirect_to root_url
  end
  
  it "should go to back to the form on validation errors" do
    
  end
  
  it "should be able to destroy dojos and associated itens"
end