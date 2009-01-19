require File.dirname(__FILE__) + '/../spec_helper'

describe ProblemsController do
  before(:each) do
    @problem = mock_model(Problem)
    @problems = mock_model(Problem)
    @problems.stub!(:shift).and_return(@problem)
  end
  it "should make a new problem" do
    Problem.should_receive(:new).once.and_return(@problem)

    post 'new'
    assigns[:problem].should equal(@problem)
  end
  it "should list all problems" do
    Problem.should_receive(:find).once.with(:all, :conditions => ['kata = ?', true]).and_return(@problems)
    Problem.should_receive(:find).once.with(:all, :conditions => ['kata = ?', false]).and_return(@problems)
    get 'index'
    assigns[:katas].should equal(@problems)
    assigns[:randoris].should equal(@problems)
  end
end
