require File.dirname(__FILE__) + '/../spec_helper'

module KataSpecHelper
  def valid_kata_attributes
    { :title => 'A title',
      :description => 'Some description',
      :language => 'Brainfuck',
      :author => User.new
    }
  end
end

describe Kata do
  include KataSpecHelper

  before :each do
    @kata = Kata.new
  end
  it "should be valid" do
    @kata.attributes = valid_kata_attributes
    @kata.should be_valid
  end
  it "should be valid without description" do
    @kata.attributes = valid_kata_attributes.except(:description)
    @kata.should be_valid
  end
  it "should not be valid without title" do
    @kata.attributes = valid_kata_attributes.except(:title)
    @kata.should_not be_valid
  end
  it "should not be valid without language" do
    @kata.attributes = valid_kata_attributes.except(:language)
    @kata.should_not be_valid
  end
  it "should not be valid without an author" do
    @kata.attributes = valid_kata_attributes.except(:author)
    @kata.should_not be_valid
  end
  it "should relate to an author" do
    Kata.reflect_on_association(:author).should_not be_nil
  end
end
