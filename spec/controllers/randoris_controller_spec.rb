require File.dirname(__FILE__) + '/../spec_helper'

describe RandorisController do
  before(:each) do
    @randori = mock_model(Randori)
    @randoris = mock_model(Randori)
  end
  it "should make a new randori" do
    Randori.should_receive(:new).once.and_return(@randori)

    post 'new'
    assigns[:randori].should equal(@randori)
  end
  it "should list all randoris" do
    Randori.should_receive(:find).once.with(:all).and_return(@randoris)
    get 'index'
    assigns[:randoris].should equal(@randoris)
  end
end
