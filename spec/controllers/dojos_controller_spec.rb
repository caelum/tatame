require File.dirname(__FILE__) + '/../spec_helper'

describe DojosController do
  
  before(:each) do
    @dojo = mock_model(Dojo)
    @dojo.stub!(:new_record?).and_return(true)
  end
  
  it "should save the dojo and redirect to index" do
    Dojo.should_receive(:new).and_return(@dojo)
    @dojo.should_receive(:save).and_return(true)
    
    post 'create'
    assigns[:dojo].should equal(@dojo)
    response.should redirect_to(:action => 'index')
  end
  
  it "should go to back to the form on validation errors"
  
  it "should be able to destroy dojos and associated itens"
end