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
  it "should save a randori and redirect to the randoris page" do
    Randori.should_receive(:new).once.with(params[:randori]).and_return(@randori)
    @randori.should_receive(:save).once.and_return(true)

    post 'create'
    assigns[:randori].should equal(@randori)
    response.should redirect_to(randoris_path)
  end
  it "should delete a randori and redirect to the randoris page" do
    Randori.should_receive(:find).once.with(params[:id]).and_return(@randori)
    @randori.should_receive(:destroy).once

    post 'destroy'
    response.should redirect_to(randoris_path)
  end
end
